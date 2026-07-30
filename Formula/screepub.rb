class Screepub < Formula
  desc "Screenplay PDF to reflowable EPUB3/MOBI converter"
  homepage "https://github.com/ssandweiss/screepub"
  url "https://github.com/ssandweiss/screepub/releases/download/v0.3.0/screepub-macOS"
  sha256 "173fb4899a74a48830bc9151c58141607bad18eceaf1c17d4d9c189f0702cf02"
  license "AGPL-3.0-or-later"

  livecheck do
    url "https://github.com/ssandweiss/screepub/releases/latest"
    strategy :github_latest
  end

  # A signed, notarized universal Mach-O built by the project's release
  # workflow. There is no source build here, so no bottles.
  depends_on :macos

  def install
    bin.install "screepub-macOS" => "screepub"
  end

  test do
    assert_match "screepub", shell_output("#{bin}/screepub --help")
  end
end
