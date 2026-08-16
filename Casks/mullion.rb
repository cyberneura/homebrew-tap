cask "mullion" do
  version "0.2.0"
  sha256 "ffbd8fde31c812d8db42e9ae92f2a588a6607dccfef45e59820fc5393b0dd650"

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
