class JMenu < Formula
  desc "Simple TUI menu launcher. Press `j` and Enter to pick and run a command"
  homepage "https://github.com/cyberneura/j-menu"
  version "0.3.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/j-menu/releases/download/v0.3.0/j-menu-aarch64-apple-darwin.tar.xz"
      sha256 "a4e1a39c9cc9fc8a47c83b845509ee418497798426746b622983c377a6533d18"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/j-menu/releases/download/v0.3.0/j-menu-x86_64-apple-darwin.tar.xz"
      sha256 "4c7cbfd642063ddafcf56bf17a45a8ed6766366f69cf61b8980e121463555bf0"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/j-menu/releases/download/v0.3.0/j-menu-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "28c36bd5770c92f2e560efa7a03b544879537981538ae6620cb6cfb1d0bea267"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/j-menu/releases/download/v0.3.0/j-menu-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a647b281c899aa54a6492934f1cc3ec0c4aa74977b0d1f4d529c60f8ab0f43fe"
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
    bin.install "j-menu"
  end

  test do
    assert_match "j-menu", shell_output("#{bin}/j-menu --version")
  end
end
