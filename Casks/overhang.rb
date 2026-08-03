cask "overhang" do
  version "0.5.1"
  sha256 "a1ed3daaf522f931584d034f017eb45fe5482574844844f15493b0cbe1ad9167"

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
