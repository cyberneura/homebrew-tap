cask "flintkey" do
  version "0.10.3"
  sha256 "b82516db33bcaa3f3f7fa97cd3329870336235c4e654382402030cb283d82dea"

  url "https://github.com/cyberneura/flintkey/releases/download/v#{version}/Flintkey_#{version}_universal.dmg"
  name "Flintkey"
  desc "Keyboard launcher whose settings live in files"
  homepage "https://github.com/cyberneura/flintkey"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Flintkey.app"

  # ~/.config/flintkey is left alone: it holds the user's own settings, often a Git checkout.
  zap trash: [
    "~/.local/state/flintkey",
    "~/Library/Caches/com.cyberneura.flintkey",
    "~/Library/Preferences/com.cyberneura.flintkey.plist",
    "~/Library/Saved Application State/com.cyberneura.flintkey.savedState",
    "~/Library/WebKit/com.cyberneura.flintkey",
  ]
end
