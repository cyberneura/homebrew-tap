#!/usr/bin/env python3
"""Points every cask and formula here at the latest release of its project.

The tap updates itself rather than each project pushing to it. A project pushing
here needs a token that can write to this repository, which means handing that
token to every project; asking from here needs nothing but the token Actions
already gives a workflow over its own repository.

Run with no arguments to update everything, or name files to limit it:

    scripts/update.py
    scripts/update.py Casks/runandlog.rb
"""

from __future__ import annotations

import hashlib
import json
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

VERSION_LINE = re.compile(r'^(\s*version\s+")([^"]+)(")', re.MULTILINE)
# Only the quoted forms. `url :url` inside a livecheck block names the download
# url rather than being one, and `sha256 :no_check` is not a checksum.
URL_LINE = re.compile(r'^(\s*url\s+")([^"]+)(")', re.MULTILINE)
SHA_LINE = re.compile(r'^(\s*sha256\s+")([0-9a-f]{64})(")', re.MULTILINE)
GITHUB_REPO = re.compile(r'github\.com/([^/"]+)/([^/"]+)')


def latest_release(repo: str) -> str | None:
    """The newest published release of a project, without its leading v.

    `releases/latest` leaves out drafts and prereleases, which is what makes it
    the right question: a draft is visible only to the project's owners, and a
    cask built from one would hand everyone else a 404.
    """
    result = subprocess.run(
        ["gh", "api", f"repos/{repo}/releases/latest", "--jq", ".tag_name"],
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        print(f"  could not read the latest release of {repo}: {result.stderr.strip()}")
        return None
    return result.stdout.strip().lstrip("v")


def newer(candidate: str, current: str) -> bool:
    """Whether `candidate` is a later version than `current`.

    Compared as numbers rather than as text, so that 0.10.0 counts as later than
    0.9.0. Anything that does not parse falls back to "different means newer",
    since a tap that will not move is worse than one that moves sideways.
    """

    def parts(version: str) -> list[int] | None:
        try:
            return [int(piece) for piece in version.split(".")]
        except ValueError:
            return None

    left, right = parts(candidate), parts(current)
    if left is None or right is None:
        return candidate != current
    return left > right


def sha256_of(url: str) -> str:
    with urllib.request.urlopen(url) as response:  # noqa: S310 - the urls are ours
        digest = hashlib.sha256()
        for chunk in iter(lambda: response.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def update(path: Path) -> bool | None:
    """Returns True if the file changed, False if it was already current, None on error."""
    text = path.read_text()
    print(f"{path}:")

    version_match = VERSION_LINE.search(text)
    if not version_match:
        print("  no version to update")
        return False
    current = version_match.group(2)

    urls = list(URL_LINE.finditer(text))
    shas = list(SHA_LINE.finditer(text))
    if not urls:
        print("  no download url")
        return False
    # Paired in the order they appear. Casks put the checksum before the url and
    # formulae put it after, so position within the file cannot be the rule --
    # but each layout keeps them in step, so the nth of one belongs to the nth of
    # the other.
    if len(urls) != len(shas):
        print(f"  {len(urls)} urls against {len(shas)} checksums; leaving it alone")
        return None

    repo_match = GITHUB_REPO.search(text)
    if not repo_match:
        print("  no github project to ask")
        return None
    repo = f"{repo_match.group(1)}/{repo_match.group(2)}"

    latest = latest_release(repo)
    if latest is None:
        return None
    if latest == current:
        print(f"  {current} is current")
        return False
    if not newer(latest, current):
        print(f"  {repo} is on {latest}, older than the {current} here; leaving it alone")
        return False

    print(f"  {current} -> {latest}")
    checksums = []
    for match in urls:
        url = match.group(2).replace("#{version}", latest)
        if "#{" in url:
            print(f"  cannot work out {url}; leaving it alone")
            return None
        print(f"  {url}")
        try:
            checksums.append(sha256_of(url))
        except Exception as error:  # noqa: BLE001 - reported and skipped either way
            print(f"  could not fetch it: {error}")
            return None

    # Rebuilt from the end so that earlier offsets stay valid.
    for match, checksum in reversed(list(zip(shas, checksums))):
        text = text[: match.start()] + match.group(1) + checksum + match.group(3) + text[match.end() :]
    version_match = VERSION_LINE.search(text)
    text = (
        text[: version_match.start()]
        + version_match.group(1)
        + latest
        + version_match.group(3)
        + text[version_match.end() :]
    )
    path.write_text(text)
    return True


def main() -> int:
    if len(sys.argv) > 1:
        paths = [Path(argument) for argument in sys.argv[1:]]
    else:
        paths = sorted(ROOT.glob("Casks/*.rb")) + sorted(ROOT.glob("Formula/*.rb"))

    changed, failed = [], []
    for path in paths:
        outcome = update(path)
        if outcome is None:
            failed.append(path.name)
        elif outcome:
            changed.append(path.name)

    print()
    print(f"updated: {', '.join(changed) if changed else 'nothing'}")
    if failed:
        # Reported rather than swallowed: a tap that quietly stops updating looks
        # exactly like one with nothing to update.
        print(f"could not update: {', '.join(failed)}")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
