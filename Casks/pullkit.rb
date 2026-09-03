cask "pullkit" do
  version "0.2.1"
  sha256 "b059b359ebb0eed50f300b256dbad70d4712c50f955a2ed4ad51bae539ab78a2"

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
