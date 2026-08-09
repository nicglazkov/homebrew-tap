cask "gcloud-dot" do
  version "1.0.2"
  sha256 "779221539ccb3dc8be03b38c1b08d13f2789ef3d68467222ae67e1373d6738d2"

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
  # the terminal - and the two can never be different versions.
  binary "#{appdir}/GCloud Dot.app/Contents/MacOS/gcloud-dot"

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
