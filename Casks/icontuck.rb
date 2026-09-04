cask "icontuck" do
  version "0.0.1"
  sha256 "fa145d55384430588fcb6657633d41609ca92ba2282fa265a3741ff31219cbb8"

  url "https://github.com/cyberneura/icontuck/releases/download/v#{version}/Icontuck_#{version}_universal.dmg"
  name "Icontuck"
  desc "Menu bar utility that tucks icons off the left edge"
  homepage "https://github.com/cyberneura/icontuck"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Deployment target is macOS 15.0.
  depends_on macos: :sequoia

  app "Icontuck.app"

  # Icontuck runs sandboxed, so everything it writes lives under its container —
  # including the preferences, which is why there is no plain
  # ~/Library/Preferences/com.cyberneura.icontuck.plist to trash.
  # The status item slots (NSStatusItem Preferred Position ...) are stored there
  # too, so zapping resets the tuck boundary along with the settings.
  zap trash: [
    "~/Library/Application Scripts/com.cyberneura.icontuck",
    "~/Library/Containers/com.cyberneura.icontuck",
    "~/Library/Saved Application State/com.cyberneura.icontuck.savedState",
  ]
end
