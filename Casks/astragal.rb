cask "astragal" do
  version "0.2.1"
  sha256 "33a9b437d8545271b3a23be0f3cba55ea013c0b62ef46352762f50fe5bec5d69"

  url "https://github.com/cyberneura/astragal/releases/download/v#{version}/Astragal_#{version}_universal.dmg"
  name "Astragal"
  desc "Lightweight terminal with a menu bar drop-down"
  homepage "https://github.com/cyberneura/astragal"

  livecheck do
    url :url
    strategy :github_latest
  end

  # tauri.conf.json の bundle.macOS.minimumSystemVersion が 11.0。
  depends_on macos: :big_sur

  app "Astragal.app"

  # bundle identifier (com.cyberneura.astragal) は tauri.conf.json の `identifier`
  # に一致する (Tauri がそのまま CFBundleIdentifier に入れる)。
  #   https://github.com/cyberneura/astragal/blob/main/src-tauri/tauri.conf.json
  # 設定は ~/.config/astragal/config.yaml (src-tauri/src/config.rs)。残りは
  # Tauri (WKWebView) アプリが作る標準的なパス。存在しないパスがあっても zap は
  # 黙って飛ばすので、消し残しより広めに取ってある。
  zap trash: [
    "~/.config/astragal",
    "~/Library/Caches/com.cyberneura.astragal",
    "~/Library/Preferences/com.cyberneura.astragal.plist",
    "~/Library/Saved Application State/com.cyberneura.astragal.savedState",
    "~/Library/WebKit/com.cyberneura.astragal",
  ]
end
