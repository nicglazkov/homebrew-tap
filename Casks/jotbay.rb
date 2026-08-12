cask "jotbay" do
  version "1.9.1"
  sha256 "cf95d0eca8ec4c53105e6f4ebd3e2b94e41834c15c706d1118c78ceb9cf0833e"

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
