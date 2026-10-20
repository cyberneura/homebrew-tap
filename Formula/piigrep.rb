class Piigrep < Formula
  desc "Find personal information in files, on-device"
  homepage "https://github.com/cyberneura/piigrep"
  version "0.1.0"
  license "MIT"

  # Apple Silicon only on macOS: --fm needs macOS 27, which Intel Macs do not
  # run. The binary is not notarized; a formula does not quarantine what it
  # installs, so Gatekeeper does not stop it.
  on_macos do
    depends_on arch: :arm64
    url "https://github.com/cyberneura/piigrep/releases/download/v0.1.0/piigrep-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "a4df96382dcdabc905bd21bbbb5e0ad5dffae19bf0a8c5e64da04e20a67cf38a"
  end
  on_linux do
    on_intel do
      url "https://github.com/cyberneura/piigrep/releases/download/v0.1.0/piigrep-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fac69675689d01fb64ad80762b2ac556b477f246b222edd4f3b3e46138376ddc"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    bin.install "piigrep"
  end

  test do
    assert_match "piigrep", shell_output("#{bin}/piigrep --version")
    (testpath/"a.txt").write("mail: taro@example.jp\n")
    assert_match "a.txt:1:email:taro@example.jp", shell_output("#{bin}/piigrep #{testpath}/a.txt")
  end
end
