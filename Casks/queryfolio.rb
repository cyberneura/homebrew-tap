cask "queryfolio" do
  version "1.12.1"
  sha256 "fcb4552751c97da60bd01025e6d828e2dadfd86a3ddeb2b6f98976895ddfe89b"

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
