cask "askdown" do
  version "0.3.1"
  sha256 "cb9012e8259096b5570d4a52694e874aafb77c3727fe3ff416540e1dbc628d09"

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
