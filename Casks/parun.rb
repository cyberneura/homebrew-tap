cask "parun" do
  version "0.4.0"
  sha256 "53f6013889694ddd49c82a1f92fbc9d2ae8d04ac86290e1e6b47d7a0fa342594"

  url "https://github.com/cyberneura/parun/releases/download/v#{version}/parun-v#{version}-aarch64-apple-darwin.tar.gz"
  name "parun"
  desc "Runs shell commands in parallel, each in its own pane of the terminal"
  homepage "https://github.com/cyberneura/parun"

  depends_on arch: :arm64

  livecheck do
    url :url
    strategy :github_latest
  end

  # The archive holds a directory, and a cask does not descend into it: the path
  # has to name it. Keep this in step with how the workflow packages the build.
  binary "parun-v#{version}-aarch64-apple-darwin/parun"
end
