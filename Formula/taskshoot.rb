class Taskshoot < Formula
  desc "Taskshoot task operations CLI (AI-agent friendly)"
  homepage "https://taskshoot.com"
  version "0.14.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.14.0/taskshoot-aarch64-apple-darwin.tar.xz"
      sha256 "9826214e6acf6688f55275f43ebaf246b7db88e7874cbe5f7e98166a1a929d85"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.14.0/taskshoot-x86_64-apple-darwin.tar.xz"
      sha256 "515cf28b439f4e45031cf22c3543933978374c374a31388ea1e8be6f835e1636"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.14.0/taskshoot-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "cf42595c20558d8a2837e2b75211f807c3c2687957df265195101b19bbca140c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.14.0/taskshoot-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "89771f0c2bdb90f0e6ac87fa1e052a9273a4b3a9a8f09b4f26e98beaa45f007a"
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
