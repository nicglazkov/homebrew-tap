cask "overhang" do
  version "0.5.3"
  sha256 "e7f5f669738b480daf4b0a3f337fcdf0e5e9fc3aaf539e3497c2f357257a0c78"

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
