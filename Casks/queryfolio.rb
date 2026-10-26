cask "queryfolio" do
  version "0.13.0"
  sha256 "66acf21ebfa7e1254c1182c2a192bdbf09caa61d044350aebf19475c5d6cb976"

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
