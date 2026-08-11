class Screepub < Formula
  desc "Screenplay PDF to reflowable EPUB3/MOBI converter"
  homepage "https://github.com/ssandweiss/screepub"
  # Per-arch tarballs, not one universal binary: bun embeds its runtime per
  # slice, so universal doubled every download for no benefit. The cask's
  # DMG stays universal on purpose, because a browser cannot detect the
  # visitor's CPU and Homebrew can.
  #
  # Two things this file learned the hard way, both enforced by brew:
  #  - NOT `on_arm do url ... end`. That is cask syntax; `brew style` rejects
  #    url/sha256 inside on_arm/on_intel in a formula.
  #  - NO `version` stanza. Homebrew scans the version out of the tag in the
  #    url, and an explicit one audits as redundant. So the tag is written
  #    literally, in BOTH urls, and a version bump edits both.
  if Hardware::CPU.arm?
    url "https://github.com/ssandweiss/screepub/releases/download/v0.5.3/screepub-cli-macos-arm64.tar.gz"
    sha256 "c48fa4f9696c054220739d0577ffd6f66eb9a5ef18dbf2ea42133ec1cbc3e305"
  else
    url "https://github.com/ssandweiss/screepub/releases/download/v0.5.3/screepub-cli-macos-x64.tar.gz"
    sha256 "88f75773d3587e3e702386a29bde2682ac6148081818f70bfbb41be8793d57fc"
  end
  license "AGPL-3.0-or-later"

  livecheck do
    url "https://github.com/ssandweiss/screepub/releases/latest"
    strategy :github_latest
  end

  # A signed, notarized Mach-O built by the project's release workflow.
  # There is no source build here, so no bottles.
  depends_on :macos

  def install
    # The tarball holds a single file, already named plain `screepub`.
    bin.install "screepub"
  end

  test do
    # Pins the download to the version this formula claims: a stale url or a
    # mismatched asset fails here rather than at somebody's prompt.
    assert_match version.to_s, shell_output("#{bin}/screepub --version")
    assert_match "screenplay", shell_output("#{bin}/screepub --help")
  end
end
