# ssandweiss/tap

Homebrew tap for [Screepub](https://github.com/ssandweiss/screepub) — turns
screenplay PDFs into reflowable e-books you can actually read on a Kindle.

## The Mac app

```bash
brew install --cask ssandweiss/tap/screepub
```

Notarized, universal (Apple Silicon and Intel), macOS 14+.

## The command-line converter

```bash
brew install ssandweiss/tap/screepub
```

```bash
screepub script.pdf              # → script.epub + script.fountain
screepub script.pdf --mobi       # also a MOBI for USB sideload
screepub --help
```

The two can be installed side by side — the cask puts `Screepub.app` in
`/Applications`, the formula puts a `screepub` binary on your `PATH`.

## Upgrading

```bash
brew update && brew upgrade screepub
```

## Licence

Screepub is AGPL-3.0-or-later. This tap only contains packaging metadata.
