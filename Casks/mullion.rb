cask "mullion" do
  version "0.1.3"
  sha256 "550843ec0c5da7f675ca5b7a61bc30ba59a267a5413de4295ebd6f7d5702e4ad"

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
