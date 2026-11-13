cask "dagscape" do
  version "0.4.1"
  sha256 "7a122534d3a9fe631a6f25e33c02bdf683f3ba6f1612fcf215f3f6086085ccbb"

  url "https://github.com/cyberneura/dagscape/releases/download/v#{version}/Dagscape_#{version}_universal.dmg"
  name "Dagscape"
  desc "Branch graph browser for Git"
  homepage "https://github.com/cyberneura/dagscape"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Dagscape.app"

  zap trash: [
    "~/Library/Application Support/com.cyberneura.dagscape",
    "~/Library/Caches/com.cyberneura.dagscape",
    "~/Library/Preferences/com.cyberneura.dagscape.plist",
    "~/Library/Saved Application State/com.cyberneura.dagscape.savedState",
    "~/Library/WebKit/com.cyberneura.dagscape",
  ]
end
