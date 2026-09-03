cask "killdeer" do
  version "0.2.5"
  sha256 "7cbcf4750b8c81a44243697eb1e0cf2461f661796cfc435c13e73d57f1e35133"

  url "https://github.com/cyberneura/killdeer/releases/download/v#{version}/Killdeer_#{version}_universal.dmg"
  name "Killdeer"
  desc "Finds runaway CPU processes and disconnected Chrome helpers"
  homepage "https://github.com/cyberneura/killdeer"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Package.swift declares .macOS(.v14), so anything older cannot run it.
  depends_on macos: :sonoma

  app "Killdeer.app"
  # The cli lives inside the bundle rather than being shipped beside it, so the
  # app and the command cannot end up as different versions of each other.
  binary "#{appdir}/Killdeer.app/Contents/MacOS/killdeer"

  # A menu bar app with no windows is not quit by closing anything, so an
  # upgrade would otherwise replace the bundle underneath a running copy.
  uninstall quit: "com.cyberneura.killdeer"

  # bundle identifier (com.cyberneura.killdeer) matches packaging/Info.plist.
  #   https://github.com/cyberneura/killdeer/blob/main/packaging/Info.plist
  # Killdeer stores no settings of its own yet; these are the paths a menu bar
  # app gets from AppKit and UserNotifications. zap skips paths that are not
  # there, so this is drawn wider than what exists today.
  #
  # Not covered: the login item. It is an SMAppService registration held by
  # macOS, not a file, so zap cannot reach it; turn it off in the app before
  # uninstalling, or in System Settings > General > Login Items afterwards.
  zap trash: [
    "~/Library/Caches/com.cyberneura.killdeer",
    "~/Library/Preferences/com.cyberneura.killdeer.plist",
    "~/Library/Saved Application State/com.cyberneura.killdeer.savedState",
  ]
end
