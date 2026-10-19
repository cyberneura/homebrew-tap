cask "dagscape" do
  version "0.3.0"
  sha256 "fcead9922543f4c57c2ec5a72d483d4d42764251e020b8b137cda21c81a57cfb"

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
