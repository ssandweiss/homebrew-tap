cask "screepub" do
  version "0.7.4"
  sha256 "7cf8106a285c5910e068f4867740fca58987be8523f874bba0ab9f5f76da26da"

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
