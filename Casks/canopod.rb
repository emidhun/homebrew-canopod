cask "canopod" do
  version "0.5.0"
  sha256 "c1f993a8479436cfd4d438b1e1ab6b4bcb25d2ca2fe767aa03f8b2f0fc7f37ab"

  url "https://github.com/emidhun/canopod/releases/download/v#{version}/Canopod_#{version}_aarch64.dmg"
  name "Canopod"
  desc "Menu-bar git-worktree and dev-service manager"
  homepage "https://github.com/emidhun/canopod"

  depends_on arch: :arm64

  app "Canopod.app"

  # not notarized yet — remove ONLY the quarantine attribute on install
  # (xattr -cr would strip sealed resources and break the ad-hoc signature)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Canopod.app"],
                   sudo: false
  end

  caveats <<~EOS
    Canopod is not notarized yet. If macOS still warns on first launch, use
    System Settings → Privacy & Security → "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/Canopod.app"

    Canopod lives in the menu bar — look for the fork icon after launch.
  EOS

  zap trash: [
    "~/Library/Application Support/com.midhunkumare.canopod",
    "~/Library/Caches/com.midhunkumare.canopod",
    "~/Library/Logs/com.midhunkumare.canopod",
    "~/Library/WebKit/com.midhunkumare.canopod",
    "~/Library/Application Support/com.midhunkumare.canopy",
    "~/Library/Caches/com.midhunkumare.canopy",
    "~/Library/Logs/com.midhunkumare.canopy",
    "~/Library/WebKit/com.midhunkumare.canopy",
  ]
end
