cask "gcloud-dot" do
  version "1.1.10"
  sha256 "330e78ccde5b789da92fe59b2fb1346c1a9b6487d84ea5503536445de592a3dd"

  url "https://github.com/nicglazkov/gcloud-dot/releases/download/v#{version}/GCloud-Dot-#{version}.dmg",
      verified: "github.com/nicglazkov/gcloud-dot/"
  name "GCloud Dot"
  desc "Shows whether your gcloud session is alive and how long it has left"
  homepage "https://nicglazkov.github.io/gcloud-dot/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "GCloud Dot.app"
  # The CLI ships inside the bundle, so one cask serves both the menu bar and
  # the terminal, and the two can never be different versions.
  binary "#{appdir}/GCloud Dot.app/Contents/MacOS/gcloud-dot"

  # Quit it before replacing the bundle. This app is a tray icon that is always
  # running, so without this every upgrade leaves the old process alive against
  # files that have just been swapped underneath it.
  uninstall quit: "com.nic.gclouddot"

  zap trash: [
    "~/Library/Application Support/GCloudDot",
    "~/Library/LaunchAgents/com.nic.gclouddot.plist",
  ]

  caveats <<~EOS
    Nothing in your gcloud configuration is modified, by install or by uninstall.

    Measured session lengths live in ~/Library/Application Support/GCloudDot and
    survive an uninstall, because each one costs a real session's worth of
    waiting to observe. `brew uninstall --zap` removes them too.
  EOS
end
