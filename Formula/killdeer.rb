class Killdeer < Formula
  desc "macOS process monitor and Chrome helper cleaner"
  homepage "https://github.com/cyberneura/killdeer"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/cyberneura/killdeer/releases/download/v0.2.0/killdeer-macos.zip"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "killdeer"
    doc.install "README.md"
  end

  test do
    assert_match "killdeer", shell_output("#{bin}/killdeer --help 2>&1", 64)
  end
end
