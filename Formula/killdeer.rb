class Killdeer < Formula
  desc "macOS process monitor and Chrome helper cleaner"
  homepage "https://github.com/cyberneura/killdeer"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/cyberneura/killdeer/releases/download/v0.2.0/killdeer-macos.zip"
      sha256 "b577554a375bb8d8a753e021d95b41afd93f31fb2020ceb851f69c09d36d87d2"
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