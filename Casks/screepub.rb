cask "screepub" do
  version "0.6.0"
  sha256 "3f0a667ab904acc295913368b879b96e94264923ffcf74b95f2b6499216bc5ac"

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
