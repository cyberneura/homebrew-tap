cask "queryfolio" do
  version "0.2.0"
  sha256 "b2b1d384e5af3758fabaae0416004c1e8a787553579e098773d7c8faab25a5b0"

  url "https://github.com/cyberneura/queryfolio/releases/download/v#{version}/QueryFolio_#{version}_universal.dmg"
  name "QueryFolio"
  desc "Multi-purpose SQL GUI client"
  homepage "https://github.com/cyberneura/queryfolio"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "QueryFolio.app"

  zap trash: [
    "~/.config/queryfolio",
    "~/Library/Caches/com.cyberneura.queryfolio",
    "~/Library/Preferences/com.cyberneura.queryfolio.plist",
    "~/Library/Saved Application State/com.cyberneura.queryfolio.savedState",
    "~/Library/WebKit/com.cyberneura.queryfolio",
  ]
end
