cask "flintkey" do
  version "0.10.0"
  sha256 "a73146634f0537b154a6a876359105b140c096c9d5db21b01ec5f56733d4c125"

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
