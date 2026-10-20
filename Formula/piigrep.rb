class Piigrep < Formula
  desc "Find personal information in files, on-device"
  homepage "https://github.com/cyberneura/piigrep"
  version "0.1.1"
  license "MIT"

  # Apple Silicon only on macOS: --fm needs macOS 27, which Intel Macs do not
  # run. The binary is not notarized; a formula does not quarantine what it
  # installs, so Gatekeeper does not stop it.
  livecheck do
    url :url
    strategy :github_latest
  end

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cyberneura/piigrep/releases/download/v0.1.1/piigrep-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "77cacf4ca911f60241a32e4dbda98e61d77392b980341d24853a5393f1663d7c"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/cyberneura/piigrep/releases/download/v0.1.1/piigrep-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7d2c76af518d921effe76af73af91473f4c7f37fa128c54917577e0d1855adc"
    end
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
