cask "kawa" do
  version "1.2.0"
  # version and sha256 are machine-managed by release.yml in Windemiatrix/kawa.
  sha256 "7d0f0809e2d838a63b309051ede837a500bc947acddac6d6f8863b14cbcfadd3"

  url "https://github.com/Windemiatrix/kawa/releases/download/v#{version}/Kawa.zip"
  name "Kawa"
  desc "Menu-bar input source switcher with per-source shortcuts (personal fork)"
  homepage "https://github.com/Windemiatrix/kawa"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Kawa.app"

  uninstall quit: "net.noraesae.Kawa"

  zap trash: [
    "~/Library/Application Support/Kawa",
    "~/Library/Preferences/net.noraesae.Kawa.plist",
  ]

  caveats do
    <<~EOS
      Kawa.app is ad-hoc signed and NOT notarized. Gatekeeper will block the
      first launch of a quarantined copy. Install without quarantine:

        brew install --cask --no-quarantine windemiatrix/tap/kawa

      Or clear the attribute after install:

        xattr -cr /Applications/Kawa.app
    EOS
  end
end
