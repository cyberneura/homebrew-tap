cask "clipboard-palette" do
  version "0.4.1"
  sha256 "3ab092e757f01c60c60e399c595db7b90e5d319880af9c37752da863612dbdb4"

  url "https://github.com/ytyng/clipboard-palette/releases/download/v#{version}/clipboard-palette_#{version}_universal.dmg"
  name "Clipboard Palette"
  desc "Show copy-to-clipboard buttons for text piped from standard input"
  homepage "https://github.com/ytyng/clipboard-palette"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "clipboard-palette.app"
  binary "#{appdir}/clipboard-palette.app/Contents/MacOS/clipboard-palette"

  zap trash: [
    "~/Library/Caches/com.ytyng.clipboard-palette",
    "~/Library/Preferences/com.ytyng.clipboard-palette.plist",
    "~/Library/Saved Application State/com.ytyng.clipboard-palette.savedState",
    "~/Library/WebKit/com.ytyng.clipboard-palette",
  ]
end
