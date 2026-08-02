cask "overhang" do
  version "0.4.0"
  sha256 "f5bcc94afe2b0534eb3a7205b702cb9060d10f7efa6cfee3b9bf3c578b7ce879"

  url "https://github.com/nicglazkov/overhang/releases/download/v#{version}/Overhang.dmg",
      verified: "github.com/nicglazkov/overhang/"
  name "Overhang"
  desc "Recovers the menu bar icons macOS hides behind the notch"
  homepage "https://github.com/nicglazkov/overhang"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Overhang.app"

  zap trash: [
    "~/Library/Preferences/com.nic.overhang.plist",
  ]
end
