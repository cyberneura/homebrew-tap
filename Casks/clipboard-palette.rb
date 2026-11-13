cask "clipboard-palette" do
  version "0.4.2"
  sha256 "025eb61f9b147747c39f81a71542a5d7b97e498bc4ca55c8cfa620834a512f97"

  url "https://github.com/ytyng/clipboard-palette/releases/download/v#{version}/Clipboard-palette_#{version}_universal.dmg"
  name "Clipboard Palette"
  desc "Show copy-to-clipboard buttons for text piped from standard input"
  homepage "https://github.com/ytyng/clipboard-palette"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Clipboard-palette.app"
  binary "#{appdir}/Clipboard-palette.app/Contents/MacOS/clipboard-palette"

  zap trash: [
    "~/Library/Caches/com.ytyng.clipboard-palette",
    "~/Library/Preferences/com.ytyng.clipboard-palette.plist",
    "~/Library/Saved Application State/com.ytyng.clipboard-palette.savedState",
    "~/Library/WebKit/com.ytyng.clipboard-palette",
  ]
end
