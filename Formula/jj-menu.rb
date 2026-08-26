class JjMenu < Formula
  desc "Simple TUI menu launcher. Press `jj` and Enter to pick and run a command"
  homepage "https://github.com/cyberneura/jj-menu"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/jj-menu/releases/download/v0.2.0/jj-menu-aarch64-apple-darwin.tar.xz"
      sha256 "34bcb4586791b1ca60325de0166ce314d1cf840746addd9c672d7632f15581cb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/jj-menu/releases/download/v0.2.0/jj-menu-x86_64-apple-darwin.tar.xz"
      sha256 "4dd725b8b44ff0ca2397cf92cf774d103d9f62422911044ddb9dbb4fe62b7b69"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/jj-menu/releases/download/v0.2.0/jj-menu-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0b90e7038ebcf2ec35fc6b74dcccbee54973db5000ba04bddde335dd1e6dd6f8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/jj-menu/releases/download/v0.2.0/jj-menu-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "72f48261e076b46b2d94aee12876145826f2e25fd44a441bfae83b58fa8f2e10"
    end
  end
  license "MIT"

  # The urls spell the version out, as cargo-dist builds them and as
  # Formula/taskshoot.rb does. scripts/update.py moves them on with the version.
  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "jj-menu"
  end

  test do
    assert_match "jj-menu", shell_output("#{bin}/jj-menu --version")
  end
end
