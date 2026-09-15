cask "flashcap" do
  version "0.3.0"
  sha256 "f56c85581684f6b9aeed4e301cca56a02dae6d734bcda3c7eb03788d32e53f81"

  url "https://github.com/cyberneura/flashcap/releases/download/v#{version}/flashcap_#{version}_universal.dmg"
  name "FlashCap"
  desc "Screenshot capture and annotation app"
  homepage "https://github.com/cyberneura/flashcap"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "flashcap.app"

  # bundle identifier (com.cyberneura.flashcap) は tauri.conf.json の `identifier`
  # に一致する (Tauri がそのまま CFBundleIdentifier に入れる)。
  #   https://github.com/cyberneura/flashcap/blob/main/src-tauri/tauri.conf.json
  # 下記は Tauri (WKWebView) アプリが作る標準的なパス。実機で `brew generate-zap`
  # を回せる時に、実際に生成されたものと突き合わせて見直すこと。
  # 存在しないパスがあっても zap は黙って飛ばすので、消し残しより広めに取ってある。
  zap trash: [
    "~/Library/Caches/com.cyberneura.flashcap",
    "~/Library/Preferences/com.cyberneura.flashcap.plist",
    "~/Library/Saved Application State/com.cyberneura.flashcap.savedState",
    "~/Library/WebKit/com.cyberneura.flashcap",
  ]
end
