# Canopod Homebrew Tap

Homebrew cask for [Canopod](https://github.com/emidhun/canopod) — a menu-bar
git-worktree + dev-service manager.

## Install

```sh
brew install --cask emidhun/canopod/canopod
```

## Upgrade

```sh
brew upgrade --cask canopod
```

Canopod was called Canopy before 0.5.0. If you installed the `canopy` cask,
`brew upgrade` moves you to `canopod` automatically.

Canopod is macOS arm64 (Apple Silicon). It isn't notarized yet; the cask clears
the quarantine attribute on install, and `brew` will print further guidance if
macOS still warns on first launch.
