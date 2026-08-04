cask "pixel-audio-bridge" do
  version "1.3.0"
  sha256 "218b6c4d1409b8856f477ca6225d279ecf41219baa6404bb2e752ba6508a65c3"

  url "https://github.com/nicglazkov/pixel-audio-bridge/releases/download/v#{version}/PixelAudioBridge.dmg",
      verified: "github.com/nicglazkov/pixel-audio-bridge/"
  name "Pixel Audio Bridge"
  desc "Routes Android phone audio to a connected output device"
  homepage "https://github.com/nicglazkov/pixel-audio-bridge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  # scrcpy does the capture and playback, so the app cannot work without it.
  # adb is deliberately not a dependency: it ships in the android-platform-tools
  # cask, whose upstream archive is replaced in place and so periodically fails
  # its checksum. Making it a hard dependency would take this cask down with it.
  depends_on formula: "scrcpy"

  app "PixelAudioBridge.app"
  # Puts `pab` on PATH. The app bundles it, and the docs tell people to run
  # `pab pair` and `pab doctor`, which without this resolve to nothing.
  binary "#{appdir}/PixelAudioBridge.app/Contents/Resources/pab"

  zap trash: [
    "~/.config/pixel-audio-bridge",
    "~/Library/Preferences/com.glazkov.pixel-audio-bridge.plist",
  ]

  caveats <<~EOS
    Pixel Audio Bridge also needs adb, from the Android SDK platform-tools.
    If you have Android Studio it is already at:
      ~/Library/Android/sdk/platform-tools
    Otherwise:
      brew install --cask android-platform-tools

    Then enable USB debugging on the phone, plug it in, and accept the prompt.
  EOS
end
