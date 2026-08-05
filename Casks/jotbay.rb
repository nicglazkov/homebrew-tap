cask "jotbay" do
  version "1.7.5"
  sha256 "16182180b6138b988ac34612457d4bcd3972984175c63718685ec161834f2369"

  url "https://github.com/nicglazkov/jotbay/releases/download/v#{version}/Jotbay.dmg",
      verified: "github.com/nicglazkov/jotbay/"
  name "Jotbay"
  desc "Keeps a folder of markdown notes in sync across machines"
  homepage "https://nicglazkov.github.io/jotbay/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Jotbay.app"
  # The CLI ships inside the app, so one cask serves both the window and the
  # terminal - and the two can never be different versions.
  binary "#{appdir}/Jotbay.app/Contents/Resources/jotbay"

  zap trash: [
    "~/Library/Application Support/Jotbay",
    "~/Library/LaunchAgents/com.jotbay.sync.plist",
    "~/Library/Logs/jotbay-sync.log",
  ]

  caveats <<~EOS
    Your notes are never touched by install or uninstall.
    First run asks where they should live; `jotbay init` does the same.
  EOS
end
