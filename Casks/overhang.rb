cask "overhang" do
  version "0.5.0"
  sha256 "09ae354527b6ac498e6c1951435a4a831d57deaeff11612ae9755049b2dc2fda"

  url "https://github.com/nicglazkov/overhang/releases/download/v#{version}/Overhang.dmg",
      verified: "github.com/nicglazkov/overhang/"
  name "Overhang"
  desc "Recovers menu bar icons hidden behind the notch"
  homepage "https://github.com/nicglazkov/overhang"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Overhang.app"

  zap trash: "~/Library/Preferences/com.nic.overhang.plist"
end
