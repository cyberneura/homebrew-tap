class Taskshoot < Formula
  desc "Taskshoot task operations CLI (AI-agent friendly)"
  homepage "https://taskshoot.com"
  version "0.11.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.11.1/taskshoot-aarch64-apple-darwin.tar.xz"
      sha256 "c160b74836cfdfd98a81e5dde6a6ba5afc6e351ed0a672e3114496af43b66044"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.11.1/taskshoot-x86_64-apple-darwin.tar.xz"
      sha256 "23060ca7729d61035aa8d2f9adc769929fc7bee2c9ae65447cf86bc0267646dd"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.11.1/taskshoot-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4956f053079588780f8733adb7b4afd119b95765c3d71efc335096bbd8f42a18"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.11.1/taskshoot-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "59e42c633670d531205461aa167038c1831a4adecc3e8f4d82ec1c39e2c8be4c"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "taskshoot" if OS.mac? && Hardware::CPU.arm?
    bin.install "taskshoot" if OS.mac? && Hardware::CPU.intel?
    bin.install "taskshoot" if OS.linux? && Hardware::CPU.arm?
    bin.install "taskshoot" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
