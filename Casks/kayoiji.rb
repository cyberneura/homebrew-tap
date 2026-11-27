cask "kayoiji" do
  version "0.8.0"
  sha256 "82525c9b03debe889ae44e25f88727711ee76aae7e3742f5ed64149cc970076e"

  url "https://github.com/cyberneura/kayoiji/releases/download/v#{version}/Kayoiji_#{version}_aarch64.zip"
  name "Kayoiji"
  desc "Japanese input method that types Japanese and English without switching modes"
  homepage "https://github.com/cyberneura/kayoiji"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The English check runs on Apple's on-device language model, which only exists on Apple
  # silicon, so the release is built for arm64 alone.
  depends_on arch: :arm64

  # An input method lives in ~/Library/Input Methods rather than /Applications.
  input_method "Kayoiji.app"

  # The bundle identifier is the `identifier` in src-tauri/tauri.conf.json; Tauri keeps learned
  # conversions (learning.json) and settings (settings.toml, rules.toml) under it.
  zap trash: [
    "~/Library/Application Support/com.cyberneura.inputmethod.Kayoiji",
    "~/Library/Caches/com.cyberneura.inputmethod.Kayoiji",
    "~/Library/Caches/kayoiji",
    "~/Library/WebKit/com.cyberneura.inputmethod.Kayoiji",
    "~/Library/WebKit/kayoiji",
  ]

  caveats <<~EOS
    Add Kayoiji as an input source before typing with it:
      System Settings > Keyboard > Input Sources > Edit > + > Japanese > Kayoiji
    If Kayoiji is not in the list, log out and log back in.

    After an upgrade, the previous version can keep running until you log out and log back in.
  EOS
end
