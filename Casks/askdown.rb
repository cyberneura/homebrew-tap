cask "askdown" do
  version "0.5.1"
  sha256 "687fc8e75da2d9467d3ec7d3b82247e066319b360e2f9f4293b492d575cd5270"

  url "https://github.com/cyberneura/askdown/releases/download/v#{version}/askdown-v#{version}-aarch64-apple-darwin.tar.gz"
  name "askdown"
  desc "Asks a person the questions written in a Markdown file, in a desktop window"
  homepage "https://github.com/cyberneura/askdown"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  # The archive holds a directory, and a cask does not descend into it: the path
  # has to name it. Keep this in step with how the workflow packages the build.
  binary "askdown-v#{version}-aarch64-apple-darwin/askdown"
end
