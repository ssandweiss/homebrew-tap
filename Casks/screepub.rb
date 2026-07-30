cask "screepub" do
  version "0.3.0"
  sha256 "77887bf59bd02dfbdbc24ffb1ebf4a9decf1ad52e8bf0e14c6e40a4fac34519a"

  url "https://github.com/ssandweiss/screepub/releases/download/v#{version}/Screepub-macOS.dmg",
      verified: "github.com/ssandweiss/screepub/"
  name "Screepub"
  desc "Converts screenplay PDFs into reflowable e-books for e-readers"
  homepage "https://github.com/ssandweiss/screepub"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Matches LSMinimumSystemVersion in the bundle. The symbol form means
  # "this version or newer"; the ">= :sonoma" string form is deprecated.
  depends_on macos: :sonoma

  app "Screepub.app"

  # Converted books live in the user's library folder and are deliberately
  # NOT zapped — they are the user's documents, not app state.
  zap trash: "~/Library/Preferences/com.darkwell.screepub.plist"
end
