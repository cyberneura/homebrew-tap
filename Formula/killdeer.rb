class Killdeer < Formula
  desc "Find runaway CPU processes and disconnected Chrome helpers"
  homepage "https://github.com/cyberneura/killdeer"
  version "0.2.3"
  url "https://github.com/cyberneura/killdeer/releases/download/v#{version}/killdeer-macos.zip"
  sha256 "a44005ca2b1c365d1f5635220684d0143e683eca745317ba8123a6f651584aa8"

  # The release is built on a macos-14 runner and shipped as one arch-less
  # `killdeer-macos.zip`, so nothing in the download says it is arm64 only.
  # Without this the install succeeds on an Intel Mac and the binary fails to
  # run. Drop it once the release ships a universal binary.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "killdeer"
    # The MenuBarExtra front end rides in the same zip. It is a plain executable
    # rather than a .app bundle, so bin is where it can be reached.
    bin.install "killdeer-app"
  end

  test do
    assert_match "killdeer scan", shell_output("#{bin}/killdeer --help")
  end
end
