cask "clipboard-palette" do
  version "0.1.1"
  sha256 "32c4883d52094c3cc56ca077e814575c9aa0974f91d40151d845f8a06ae5aba9"

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
