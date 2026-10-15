cask "queryfolio" do
  version "0.8.0"
  sha256 "cd4b50d293175f1d3c0168603337d26eaf6d1d6ab85e1b6a80f01ad19d4bc590"

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
