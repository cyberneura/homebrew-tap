cask "runandlog" do
  version "0.3.3"
  sha256 "d2d0a4263646b8e87a366c37696559439d063755f06709d12161d9d30408d0fe"

  url "https://github.com/cyberneura/runandlog/releases/download/v#{version}/runandlog-v#{version}-aarch64-apple-darwin.tar.gz"
  name "Run and Log"
  desc "Runs the shell commands in a Markdown file and writes the results back"
  homepage "https://github.com/cyberneura/runandlog"

  depends_on arch: :arm64

  livecheck do
    url :url
    strategy :github_latest
  end

  # The archive holds a directory, and a cask does not descend into it: the path
  # has to name it. Keep this in step with how the workflow packages the build.
  binary "runandlog-v#{version}-aarch64-apple-darwin/runandlog"
end
