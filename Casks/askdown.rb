cask "askdown" do
  version "0.3.0"
  sha256 "7984729abfa0808660b85926cef3bf88e874ce0f7b39aaaba4fb00ee4675a000"

  url "https://github.com/cyberneura/askdown/releases/download/v#{version}/askdown-v#{version}-aarch64-apple-darwin.tar.gz"
  name "askdown"
  desc "Asks a person the questions written in a Markdown file, in a desktop window"
  homepage "https://github.com/cyberneura/askdown"

  depends_on arch: :arm64

  livecheck do
    url :url
    strategy :github_latest
  end

  # The archive holds a directory, and a cask does not descend into it: the path
  # has to name it. Keep this in step with how the workflow packages the build.
  binary "askdown-v#{version}-aarch64-apple-darwin/askdown"
end
