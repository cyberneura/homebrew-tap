cask "queryfolio" do
  version "0.1.4"
  sha256 "7420b58f8d532103007b590ccd4cb288089b33387c66f82f51887a89a64ee3b6"

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
