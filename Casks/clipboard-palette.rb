cask "clipboard-palette" do
  version "0.3.1"
  sha256 "0af0dc590e149f501fe8ce18c38afbeaee6311002459c9dd334b32294ef8a631"

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
