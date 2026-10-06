cask "runandlog" do
  version "0.10.0"
  sha256 "ab011dccdc7955fe8876b27bf950e24806c20dff58fe12d81601e6de3f277e6d"

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
