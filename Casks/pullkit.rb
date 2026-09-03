cask "pullkit" do
  version "0.2.0"
  sha256 "8832bfdf714ed4be59a78b4b1bb7d3ccc80e210b9130667a9201040c6c32338d"

  url "https://github.com/cyberneura/pullkit/releases/download/v#{version}/pullkit-v#{version}-aarch64-apple-darwin.tar.gz"
  name "Pullkit"
  desc "Lists configured Git repositories and syncs them together"
  homepage "https://github.com/cyberneura/pullkit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  # The archive holds a directory, and a cask does not descend into it: the path
  # has to name it. Keep this in step with how the workflow packages the build.
  binary "pullkit-v#{version}-aarch64-apple-darwin/pullkit"

  # The same binary opens the window with --gui, so there is no app bundle to
  # trash. The config is the only thing it writes outside the cellar.
  zap trash: "~/.config/pullkit"
end
