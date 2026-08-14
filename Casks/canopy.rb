cask "canopy" do
  version "0.4.7"
  sha256 "fbcd627edbfbcfe7555d830833ee29e137ab442c6975eea82c0de5919ae0b71a"

  url "https://github.com/emidhun/canopy/releases/download/v#{version}/Canopy_#{version}_aarch64.dmg"
  name "Canopy"
  desc "Menu-bar git-worktree and dev-service manager"
  homepage "https://github.com/emidhun/canopy"

  depends_on arch: :arm64

  app "Canopy.app"

  # not notarized yet — remove ONLY the quarantine attribute on install
  # (xattr -cr would strip sealed resources and break the ad-hoc signature)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Canopy.app"],
                   sudo: false
  end

  caveats <<~EOS
    Canopy is not notarized yet. If macOS still warns on first launch, use
    System Settings → Privacy & Security → "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/Canopy.app"

    Canopy lives in the menu bar — look for the fork icon after launch.
  EOS

  zap trash: [
    "~/Library/Application Support/com.midhunkumare.canopy",
    "~/Library/Caches/com.midhunkumare.canopy",
    "~/Library/WebKit/com.midhunkumare.canopy",
  ]
end
