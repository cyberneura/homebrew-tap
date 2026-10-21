cask "dagscape" do
  version "0.4.0"
  sha256 "35b14e7afbd658ab926146f2c676cfc8a1fba3ce960e8c0d543faaf0c4e31a1e"

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
