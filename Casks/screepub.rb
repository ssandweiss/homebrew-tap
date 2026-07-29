cask "screepub" do
  version "0.2.0"
  sha256 "1c178aed4279a9e481f4390158e794b6fb65bc5d96758c82b01ba51b611debad"

  url "https://github.com/ssandweiss/screepub/releases/download/v#{version}/Screepub-macOS.dmg",
      verified: "github.com/ssandweiss/screepub/"
  name "Screepub"
  desc "Converts screenplay PDFs into reflowable e-books for e-readers"
  homepage "https://github.com/ssandweiss/screepub"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Matches LSMinimumSystemVersion in the bundle.
  depends_on macos: ">= :sonoma"

  app "Screepub.app"

  # Converted books live in the user's library folder and are deliberately
  # NOT zapped — they are the user's documents, not app state.
  zap trash: "~/Library/Preferences/com.darkwell.screepub.plist"
end
