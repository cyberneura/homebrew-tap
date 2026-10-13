cask "octetly" do
  version "0.9.0"
  sha256 "04b628d2e45265d4b69cff6ea90e91e0d630d2098edf4ce02316b0efddf23b91"

  url "https://github.com/cyberneura/octetly/releases/download/v#{version}/Octetly_#{version}_universal.dmg"
  name "Octetly"
  desc "LAN scanner that lists the hosts on the network"
  homepage "https://github.com/cyberneura/octetly"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Package.swift declares .macOS(.v14), so anything older cannot run it.
  depends_on macos: :sonoma

  app "Octetly.app"

  # bundle identifier (com.cyberneura.octetly) は packaging/Info.plist の
  # CFBundleIdentifier に一致する。
  #   https://github.com/cyberneura/octetly/blob/main/packaging/Info.plist
  # 設定は UserDefaults.standard だけなので、保存先は Preferences の plist。
  # 存在しないパスがあっても zap は黙って飛ばすので、消し残しより広めに取ってある。
  zap trash: [
    "~/Library/Caches/com.cyberneura.octetly",
    "~/Library/Preferences/com.cyberneura.octetly.plist",
    "~/Library/Saved Application State/com.cyberneura.octetly.savedState",
  ]
end
