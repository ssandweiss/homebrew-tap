class Screepub < Formula
  desc "Screenplay PDF to reflowable EPUB3/MOBI converter"
  homepage "https://github.com/ssandweiss/screepub"
  url "https://github.com/ssandweiss/screepub/releases/download/v0.2.0/screepub-macOS"
  version "0.2.0"
  sha256 "3ca643573238fc4e898577221e65d808046a37c0f300d7885327997780fe5a87"
  license "AGPL-3.0-or-later"

  # A signed, notarized universal Mach-O built by the project's release
  # workflow. There is no source build here, so no bottles.
  depends_on :macos

  livecheck do
    url "https://github.com/ssandweiss/screepub/releases/latest"
    strategy :github_latest
  end

  def install
    bin.install "screepub-macOS" => "screepub"
  end

  test do
    assert_match "screepub", shell_output("#{bin}/screepub --help")
  end
end
