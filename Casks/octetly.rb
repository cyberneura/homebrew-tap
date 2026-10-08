cask "octetly" do
  version "0.8.0"
  sha256 "e43b40b388565dd990e1ecaa9918befd1b4885b69654b443fe551c1946f621e2"

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
