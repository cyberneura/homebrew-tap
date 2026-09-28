cask "toneweave" do
  version "0.2.0"
  sha256 "7a78fbdfc1ca55fd2629b004e247190856cde93f9821e5a87bb9797b6abc81d3"

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
