# Canopy Homebrew Tap

Homebrew cask for [Canopy](https://github.com/emidhun/canopy) — a menu-bar
git-worktree + dev-service manager.

## Install

```sh
brew install --cask emidhun/canopy/canopy
```

## Upgrade

```sh
brew upgrade --cask canopy
```

Canopy is macOS arm64 (Apple Silicon). It isn't notarized yet; the cask clears
the quarantine attribute on install, and `brew` will print further guidance if
macOS still warns on first launch.
