class Taskshoot < Formula
  desc "Taskshoot task operations CLI (AI-agent friendly)"
  homepage "https://taskshoot.com"
  version "0.8.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.8.0/taskshoot-aarch64-apple-darwin.tar.xz"
      sha256 "301b969cdd63a59bbd16af2c16172617090b540760e17280a99fd82af64604bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.8.0/taskshoot-x86_64-apple-darwin.tar.xz"
      sha256 "ff337f376b5c59a688226185ad0578d20a7c2d03ac5699dd702cd9511aefc27c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.8.0/taskshoot-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0c6eee057a8d2d95957de00cc15f7740960c6592434b0cdfe2b30227fd3bc1c2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.8.0/taskshoot-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bd6aa20d4fd28e5a3b3ae5ece57f462c9c0f28e8d673b10f7d1628538c60f00d"
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
