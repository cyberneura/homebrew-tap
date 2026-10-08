cask "parun" do
  version "0.2.0"
  sha256 "8f6a88491c7d7463c14973efe297d529c8dfa219d05890ce96d7e9800fdf2b6b"

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
