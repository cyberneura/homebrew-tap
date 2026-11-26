cask "queryfolio" do
  version "1.13.0"
  sha256 "f1fb927c962c1c4aa4993a02fa44445a013d548ba9cbb694ac484c48e703231b"

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
