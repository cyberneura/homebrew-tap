cask "dagscape" do
  version "0.2.0"
  sha256 "6b18593beca4e8ca94576dc6914f19a3fa7261f713874da93685fe7f650b03a9"

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
