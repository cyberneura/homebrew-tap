cask "queryfolio" do
  version "0.2.1"
  sha256 "928641241d248d39ab7e21dcf61bdeba8c751c16bf07d4cfe8059522ff9f0df2"

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
