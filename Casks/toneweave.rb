cask "toneweave" do
  version "0.2.2"
  sha256 "542bced561341c1f5328413c05f292d97811e7e6ff318528e88df5964c9a8048"

  url "https://github.com/cyberneura/toneweave/releases/download/v#{version}/Toneweave_#{version}_universal.dmg"
  name "Toneweave"
  desc "Drafts email replies with an LLM"
  homepage "https://github.com/cyberneura/toneweave"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Toneweave.app"
  # アプリ本体が CLI も兼ねる (引数なしで起動すると GUI)。
  #   toneweave reply --clipboard -d "やんわり断る"
  binary "#{appdir}/Toneweave.app/Contents/MacOS/toneweave"

  # bundle identifier (com.cyberneura.toneweave) は tauri.conf.json の identifier と一致する。
  # ~/.config/toneweave には API キーを含む設定・下書き・生成結果が入る。
  zap trash: [
    "~/.config/toneweave",
    "~/Library/Caches/com.cyberneura.toneweave",
    "~/Library/Preferences/com.cyberneura.toneweave.plist",
    "~/Library/Saved Application State/com.cyberneura.toneweave.savedState",
    "~/Library/WebKit/com.cyberneura.toneweave",
  ]
end
