cask "overhang" do
  version "0.5.2"
  sha256 "cc0c05e146d6d335357f257d46beb4c2a2df05b2d869aa39296eda74a167f78c"

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
