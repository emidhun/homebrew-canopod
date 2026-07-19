cask "canopy" do
  version "0.4.0"
  sha256 "ae04898aec477c3894abf6341bbe58019b186bb8123d78fc14d25cb2b4a70444"

  url "https://github.com/emidhun/canopy/releases/download/v#{version}/Canopy_#{version}_aarch64.dmg"
  name "Canopy"
  desc "Menu-bar git-worktree and dev-service manager"
  homepage "https://github.com/emidhun/canopy"

  depends_on arch: :arm64

  app "Canopy.app"

  # not notarized yet — clear the quarantine attribute on install
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Canopy.app"],
                   sudo: false
  end

  caveats <<~EOS
    Canopy is not notarized yet. If macOS still warns on first launch, use
    System Settings → Privacy & Security → "Open Anyway", or run:
      xattr -cr "#{appdir}/Canopy.app"

    Canopy lives in the menu bar — look for the fork icon after launch.
  EOS

  zap trash: [
    "~/Library/Application Support/com.midhunkumare.canopy",
    "~/Library/Caches/com.midhunkumare.canopy",
    "~/Library/WebKit/com.midhunkumare.canopy",
  ]
end
