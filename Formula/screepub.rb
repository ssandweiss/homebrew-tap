class Screepub < Formula
  desc "Screenplay PDF to reflowable EPUB3/MOBI converter"
  homepage "https://github.com/ssandweiss/screepub"
  # Written whole by tools/bump-tap.sh in the screepub repository at every
  # release: edit it there, not here. Apple silicon only since the release
  # after 0.9.0; Intel Macs are no longer supported.
  url "https://github.com/ssandweiss/screepub/releases/download/v0.12.1/screepub-cli-macos-arm64.tar.gz"
  sha256 "332ab664870fb3c2803f09d6afa3c11aa595509ea2d08ac8b7cb91d56a3c9ec7"
  license "AGPL-3.0-or-later"

  livecheck do
    url "https://github.com/ssandweiss/screepub/releases/latest"
    strategy :github_latest
  end

  # A signed, notarized Mach-O built by the project's release workflow.
  # There is no source build here, so no bottles.
  depends_on arch: :arm64
  depends_on :macos

  def install
    # The tarball holds a single file, already named plain screepub.
    bin.install "screepub"
  end

  test do
    # Pins the download to the version this formula claims: a stale url or a
    # mismatched asset fails here rather than at somebody's prompt.
    assert_match version.to_s, shell_output("#{bin}/screepub --version")
    assert_match "screenplay", shell_output("#{bin}/screepub --help")
  end
end
