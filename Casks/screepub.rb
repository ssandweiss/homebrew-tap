cask "screepub" do
  version "0.7.0"
  sha256 "13c994c813c5b59766ced84b29c23531f92aa150178bd16abfa498758c53ed44"

  url "https://github.com/ssandweiss/screepub/releases/download/v#{version}/Screepub-macOS.dmg"
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
