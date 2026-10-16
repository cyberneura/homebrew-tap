cask "parun" do
  version "0.3.0"
  sha256 "b115a8b611605127e79c3315a949be9b191a3e4818ebaaf5b7d79a02e564f63a"

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
