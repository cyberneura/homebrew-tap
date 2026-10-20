cask "piigrep" do
  version "0.1.1"
  sha256 "77cacf4ca911f60241a32e4dbda98e61d77392b980341d24853a5393f1663d7c"

  url "https://github.com/cyberneura/piigrep/releases/download/v#{version}/piigrep-v#{version}-aarch64-apple-darwin.tar.gz"
  name "piigrep"
  desc "Find personal information in files, on-device"
  homepage "https://github.com/cyberneura/piigrep"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  # The archive holds a directory, and a cask does not descend into it: the path
  # has to name it. Keep this in step with how the workflow packages the build.
  binary "piigrep-v#{version}-aarch64-apple-darwin/piigrep"
end
