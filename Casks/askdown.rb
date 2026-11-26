cask "askdown" do
  version "0.5.2"
  sha256 "d9fe3647706b9a7a711f352ba34f022ff9867fde9ae3f5efa15f99be9885a2ea"

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
