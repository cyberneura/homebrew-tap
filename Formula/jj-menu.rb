class JjMenu < Formula
  desc "Simple TUI menu launcher. Press `jj` and Enter to pick and run a command"
  homepage "https://github.com/cyberneura/jj-menu"
  version "0.1.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/jj-menu/releases/download/v0.1.1/jj-menu-aarch64-apple-darwin.tar.xz"
      sha256 "a598db66e7f341f41fc94f0b1c8ba477ff2fc1235b1a8553de1fcbe80f60c98f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/jj-menu/releases/download/v0.1.1/jj-menu-x86_64-apple-darwin.tar.xz"
      sha256 "9e00434454ef6a5c9be7f4fe56817b5cc0a7039236cb0196c7a13742ee21cc20"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/jj-menu/releases/download/v0.1.1/jj-menu-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4377b87a08a0f10d8380e5001856c08ec16bfa1e1bd602787265814bba8bcc21"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/jj-menu/releases/download/v0.1.1/jj-menu-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ca25e555fef9ca966f574ff47fceda8cd615c2f84238a113bed2a127ea71494e"
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
