cask "vocelo" do
  version "0.4.0"
  sha256 "1cdb7c85875824ba5e93f1bcf7a866345818a218051307261ba09b0970c22c9d"

  url "https://github.com/cyberneura/vocelo/releases/download/v#{version}/Vocelo_#{version}_universal.dmg"
  name "Vocelo"
  desc "Menu bar push-to-talk dictation that types into the focused app"
  homepage "https://github.com/cyberneura/vocelo"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Package.swift declares .macOS(.v14) and Info.plist LSMinimumSystemVersion is 14.0.
  depends_on macos: :sonoma

  app "Vocelo.app"

  # A menu bar app with no window is not quit by closing anything, so an upgrade
  # would otherwise replace the bundle underneath a running copy.
  uninstall quit: "com.cyberneura.vocelo"

  # bundle identifier (com.cyberneura.vocelo) matches Info.plist.
  #   https://github.com/cyberneura/vocelo/blob/main/Info.plist
  # The settings are ~/.config/vocelo/config.yaml (Sources/Vocelo/ConfigManager.swift);
  # the rest are the paths AppKit gives a menu bar app. zap skips what is not there,
  # so this is drawn wider than what exists today.
  #
  # Not covered: the Microphone, Speech Recognition and Accessibility grants. Those
  # are TCC records held by macOS rather than files, so zap cannot reach them.
  # `tccutil reset All com.cyberneura.vocelo` clears them.
  zap trash: [
    "~/.config/vocelo",
    "~/Library/Caches/com.cyberneura.vocelo",
    "~/Library/Preferences/com.cyberneura.vocelo.plist",
    "~/Library/Saved Application State/com.cyberneura.vocelo.savedState",
  ]
end
