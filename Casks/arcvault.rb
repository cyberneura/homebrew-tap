cask "arcvault" do
  version "0.2.2"
  sha256 "5967c68b01fc0fba6a431ae7783e1449f9735b68b62d464c404f6fda58b6d64c"

  # tap のオーナー (cyberneura) と配布元のオーナー (ytyng) は違ってよい。
  # cask は URL を参照するだけで、リポジトリの所属は問わない。
  url "https://github.com/ytyng/arcvault/releases/download/v#{version}/Arcvault_#{version}_universal.dmg"
  name "ArcVault"
  desc "Mac archiver that produces zip files without garbled names on Windows"
  homepage "https://github.com/ytyng/arcvault"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Arcvault.app"

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
