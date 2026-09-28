cask "ambientbgm-menubar" do
  version "0.2.0"
  sha256 "e67965fa0f9ab08ecf942ae71fe4012b38055bee87d99fe36277d9f2208bd5de"

  url "https://github.com/cyberneura/ambientbgm-menubarapp/releases/download/v#{version}/AmbientBGMMenubar_#{version}_universal.dmg"
  name "AmbientBGM Menubar"
  desc "Menu bar player for ambientbgm.com"
  homepage "https://github.com/cyberneura/ambientbgm-menubarapp"

  livecheck do
    url :url
    strategy :github_latest
  end

  # scripts/make-app.sh builds with MIN_MACOS=13.0 (LSMinimumSystemVersion 13.0).
  depends_on macos: :ventura

  app "AmbientBGMMenubar.app"

  # bundle identifier (com.ambientbgm.menubar) は packaging/Info.plist の
  # CFBundleIdentifier に一致する。
  #   https://github.com/cyberneura/ambientbgm-menubarapp/blob/main/packaging/Info.plist
  # WKWebView の Cookie / localStorage / キャッシュは WebKit の既定の保存先に入る。
  zap trash: [
    "~/Library/Caches/com.ambientbgm.menubar",
    "~/Library/HTTPStorages/com.ambientbgm.menubar",
    "~/Library/Preferences/com.ambientbgm.menubar.plist",
    "~/Library/Saved Application State/com.ambientbgm.menubar.savedState",
    "~/Library/WebKit/com.ambientbgm.menubar",
  ]
end
