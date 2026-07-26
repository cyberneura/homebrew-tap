class Taskshoot < Formula
  desc "Taskshoot task operations CLI (AI-agent friendly)"
  homepage "https://taskshoot.com"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.2.0/taskshoot-aarch64-apple-darwin.tar.xz"
      sha256 "3827702c3d56eab4c65b4bc8cff44fb2d518812e5a33bbe4470b91348310f846"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.2.0/taskshoot-x86_64-apple-darwin.tar.xz"
      sha256 "d30ab9d16b8821e907d0eab17d559c35c7d19f7b72cea064928850e5b21494ec"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.2.0/taskshoot-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bef8e24d32b38efcc29a8b095001440d2278d8a78eaf0e21d7413f207331969f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/cyberneura/taskshoot-cli/releases/download/v0.2.0/taskshoot-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "80bc097bfba8fc7c2308f1b7aff2045905f0616beb5d09f80d6ddbe4bbd61546"
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
