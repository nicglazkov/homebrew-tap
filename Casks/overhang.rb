cask "overhang" do
  version "0.4.1"
  sha256 "f4f38d824512a4a952cb7e0eb06a70773f1788e8cab86ea70e76dc57b2ff359a"

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
