cask "queryfolio" do
  version "0.3.0"
  sha256 "92093262daf6ef70c09ccca39f5902cbc6c29288730c5f8b0d3754978abab49b"

  url "https://github.com/cyberneura/queryfolio/releases/download/v#{version}/Queryfolio_#{version}_universal.dmg"
  name "Queryfolio"
  desc "Multi-purpose SQL GUI client"
  homepage "https://github.com/cyberneura/queryfolio"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Queryfolio.app"

  zap trash: [
    "~/.config/queryfolio",
    "~/Library/Caches/com.cyberneura.queryfolio",
    "~/Library/Preferences/com.cyberneura.queryfolio.plist",
    "~/Library/Saved Application State/com.cyberneura.queryfolio.savedState",
    "~/Library/WebKit/com.cyberneura.queryfolio",
  ]
end
