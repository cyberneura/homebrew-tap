class Piigrep < Formula
  desc "Find personal information in files, on-device"
  homepage "https://github.com/cyberneura/piigrep"
  version "0.1.2"
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
      url "https://github.com/cyberneura/piigrep/releases/download/v0.1.2/piigrep-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "bf40722716818e6918992e427ff7fc72b8dc4a5ea23f8dddb1a2f549c04e303f"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/cyberneura/piigrep/releases/download/v0.1.2/piigrep-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f9c02286ddc82bd06ce0def78adc337077d887ea6e11950f274b4c0bda0487a"
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
