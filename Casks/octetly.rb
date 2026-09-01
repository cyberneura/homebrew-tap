cask "octetly" do
  version "0.1.0"
  sha256 "4b4eea69e4ebf54d1b46de836cf380e485bb365f9fcd132a301669a89a4d4a9a"

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
