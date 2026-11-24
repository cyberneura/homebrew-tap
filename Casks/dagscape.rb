cask "dagscape" do
  version "0.8.0"
  sha256 "5751df9573e271a7265987ab21dd1497fb5e5f58931b2776f747c2e579dda72c"

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
