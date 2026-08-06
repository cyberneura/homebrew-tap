class Taskshoot < Formula
  desc "Taskshoot task operations CLI (AI-agent friendly)"
  homepage "https://taskshoot.com"
  version "0.4.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.4.0/taskshoot-aarch64-apple-darwin.tar.xz"
      sha256 "33614a6493397897db7de1d7bacb96c02d6b6eb0d8b8b0344ad4593bc75317c7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.4.0/taskshoot-x86_64-apple-darwin.tar.xz"
      sha256 "696958f6089fc696418a355bb6b44de31696d0a75b58b67130bbb0b4fe469df5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.4.0/taskshoot-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "cca200462d5d518e9f0ab12c397b809e76f0931d9749c13692c728758156c2d4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.4.0/taskshoot-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "8ab48effae9392aca5c788c9cdeb0c4ce70274987ec809e2829e8c49a16bd6ab"
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
