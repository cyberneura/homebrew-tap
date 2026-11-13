cask "mullion" do
  version "0.3.2"
  sha256 "836d5ca1a8b1bd9623b3ae7ccc1350095a848c0f149ebb71800838a2336ea0a0"

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
