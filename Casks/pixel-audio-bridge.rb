cask "pixel-audio-bridge" do
  version "1.1.1"
  sha256 "e7460acfe0d07555a6d3a5b1add81d2fde4dd99f6b4a9cc2e4b5119d9573d520"

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
