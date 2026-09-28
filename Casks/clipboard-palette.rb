cask "clipboard-palette" do
  version "0.2.0"
  sha256 "bd18a2cfeff49178b3690a3c8957b7a509796fd67e14a6df51c97e8243e21e64"

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
