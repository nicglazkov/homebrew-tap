# Homebrew tap

Casks for my macOS applications. Each one is signed with a Developer ID,
notarized by Apple, and built universal for Apple silicon and Intel.

## Casks

| Cask | What it does | Version |
|---|---|---|
| [**pixel-audio-bridge**](https://github.com/nicglazkov/pixel-audio-bridge) | Plays your Android phone's audio through whatever your Mac is already playing to | 1.2.0 |
| [**overhang**](https://github.com/nicglazkov/overhang) | Recovers the menu bar icons macOS hides behind the notch | 0.5.3 |

## Install

```sh
brew install --cask nicglazkov/tap/pixel-audio-bridge
brew install --cask nicglazkov/tap/overhang
```

Or tap once and install by short name afterwards:

```sh
brew tap nicglazkov/tap
brew install --cask pixel-audio-bridge
```

Both require macOS 14 or later.

## Extra dependencies

`overhang` needs nothing beyond macOS.

`pixel-audio-bridge` needs `scrcpy`, which Homebrew installs for you, and `adb`
from the Android SDK, which it does not. If you have Android Studio, `adb` is
already at `~/Library/Android/sdk/platform-tools`. Otherwise:

```sh
brew install --cask android-platform-tools
```

`adb` is deliberately not a cask dependency. Its upstream archive is replaced in
place rather than versioned, so it periodically fails its checksum, and making it
a hard dependency would take this cask down with it.

## Updating

```sh
brew update && brew upgrade --cask
```

Both casks declare a `livecheck`, so `brew livecheck` reports new versions
against their GitHub releases.

## Uninstalling

```sh
brew uninstall --cask pixel-audio-bridge
```

Add `--zap` to remove preferences and config as well, rather than leaving them
behind for a reinstall.

## Licence

The cask definitions in this repository are MIT licensed. See [LICENSE](LICENSE).
The applications they install are licensed separately, in their own repositories,
and both are MIT.
