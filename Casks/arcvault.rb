cask "arcvault" do
  version "0.1.1"
  sha256 "b6070e51413224fb360aa6af143507f475e2c5049b43bf641ed845558ac0868f"

  # tap のオーナー (cyberneura) と配布元のオーナー (ytyng) は違ってよい。
  # cask は URL を参照するだけで、リポジトリの所属は問わない。
  url "https://github.com/ytyng/arcvault/releases/download/v#{version}/arcvault_#{version}_universal.dmg"
  name "ArcVault"
  desc "Mac archiver that produces zip files without garbled names on Windows"
  homepage "https://github.com/ytyng/arcvault"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "arcvault.app"

  # bundle identifier (com.ytyng.arcvault) は tauri.conf.json の `identifier`
  # に一致する (Tauri がそのまま CFBundleIdentifier に入れる)。
  #   https://github.com/ytyng/arcvault/blob/main/src-tauri/tauri.conf.json
  # 下記は Tauri (WKWebView) アプリが作る標準的なパス。実機で `brew generate-zap`
  # を回せる時に、実際に生成されたものと突き合わせて見直すこと。
  # 存在しないパスがあっても zap は黙って飛ばすので、消し残しより広めに取ってある。
  zap trash: [
    "~/Library/Caches/com.ytyng.arcvault",
    "~/Library/Preferences/com.ytyng.arcvault.plist",
    "~/Library/Saved Application State/com.ytyng.arcvault.savedState",
    "~/Library/WebKit/com.ytyng.arcvault",
  ]
end
