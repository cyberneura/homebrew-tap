cask "mullion" do
  version "0.3.1"
  sha256 "ed72eb5eddea94084ecaf70d74c02afc785f97ab65d45eebd75d94070f794ba5"

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
