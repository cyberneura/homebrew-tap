cask "mullion" do
  version "0.3.0"
  sha256 "0a599d252073f793431c96109d0ded7933b6bd648f2d4c769382645bafa709b6"

  url "https://github.com/cyberneura/mullion/releases/download/v#{version}/mullion-#{version}-universal.dmg"
  name "Mullion"
  desc "Frameless browser window for leaving a page playing"
  homepage "https://github.com/cyberneura/mullion"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Mullion.app"

  zap trash: [
    "~/Library/Application Support/Mullion",
    "~/Library/Caches/com.cyberneura.mullion",
    "~/Library/Logs/Mullion",
    "~/Library/Preferences/com.cyberneura.mullion.plist",
    "~/Library/Saved Application State/com.cyberneura.mullion.savedState",
  ]
end
