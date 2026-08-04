# Homebrew tap

Casks for my macOS applications. Each one is signed with a Developer ID,
notarized by Apple, and built universal for Apple silicon and Intel.

## Casks

| Cask | What it does | Version |
|---|---|---|
| [**jotbay**](https://nicglazkov.github.io/jotbay/) | Keeps a folder of markdown notes in sync across every machine you own | 1.7.1 |
| [**pixel-audio-bridge**](https://github.com/nicglazkov/pixel-audio-bridge) | Plays your Android phone's audio through whatever your Mac is already playing to | 1.3.0 |
| [**overhang**](https://github.com/nicglazkov/overhang) | Recovers the menu bar icons macOS hides behind the notch | 0.5.3 |

## Install

```sh
brew install --cask nicglazkov/tap/jotbay
brew install --cask nicglazkov/tap/pixel-audio-bridge
brew install --cask nicglazkov/tap/overhang
```

Or tap once and install by short name afterwards:

```sh
brew tap nicglazkov/tap
brew install --cask pixel-audio-bridge
```

All three require macOS 14 or later.

## Extra dependencies

`overhang` needs nothing beyond macOS.

`jotbay` needs `git`, which macOS provides through the Command Line Tools. It is
the only cask here that also installs a command: the CLI ships inside the app
bundle and is linked as `jotbay`, so the window and the terminal can never be
different versions. Nothing else is required — the app asks where your notes
should live the first time it opens.

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

Every cask declares a `livecheck`, so `brew livecheck` reports new versions
against their GitHub releases.

`jotbay` can also update itself with `jotbay upgrade`, which replaces the
binaries in place. Prefer `brew upgrade` if you installed it from here, so
Homebrew's idea of the installed version stays accurate.

## Uninstalling

```sh
brew uninstall --cask pixel-audio-bridge
```

Add `--zap` to remove preferences and config as well, rather than leaving them
behind for a reinstall.

`jotbay --zap` removes its preferences, background sync and logs. **It never
touches your notes** — those live in a git repository of your own, and removing
the app is not a reason to delete them.

## Licence

The cask definitions in this repository are MIT licensed. See [LICENSE](LICENSE).
The applications they install are licensed separately, in their own repositories,
and all three are MIT.
