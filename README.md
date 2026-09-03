# homebrew-tap

Homebrew tap for Cyberneura tools.

## Formulae

### taskshoot

Taskshoot task operations CLI (AI-agent friendly).

```shell
brew install cyberneura/tap/taskshoot
```

### killdeer

Finds runaway CPU processes and disconnected Chrome helpers (macOS, Apple
Silicon only).

```shell
brew install cyberneura/tap/killdeer
```

## Casks

### Mullion

Frameless browser window for leaving a page playing (macOS).

```shell
brew install --cask cyberneura/tap/mullion
```

### QueryFolio

Multi-purpose SQL GUI client (macOS).

```shell
brew install --cask cyberneura/tap/queryfolio
```

### FlashCap

Screenshot capture and annotation app (macOS).

```shell
brew install --cask cyberneura/tap/flashcap
```

### Astragal

Lightweight terminal with a menu bar drop-down (macOS).

```shell
brew install --cask cyberneura/tap/astragal
```

### Octetly

LAN scanner that lists the hosts on the network (macOS).

```shell
brew install --cask cyberneura/tap/octetly
```

### ArcVault

Mac archiver that produces zip files without garbled names on Windows.

```shell
brew install --cask cyberneura/tap/arcvault
```

Note: ArcVault lives under the `ytyng` GitHub account, not `cyberneura`. A cask
only points at a download URL, so the tap owner and the release owner do not
have to match — but this tap still owns the cask: version bumps, checksums and
any change of download location have to be applied here, and they will not
follow an upstream release automatically.
