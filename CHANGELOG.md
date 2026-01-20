# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

## [0.1.1.0] - 2025-12-18

### Added

- Added a macOS Edit menu so standard copy/cut/paste/select-all shortcuts work
  in the bundled webview (plus undo/redo).
- Add reload helper and optional reload shortcuts (Cmd/Ctrl+R, F5).

## [0.1.0.0] - 2025-12-18

### Added

- Initial release of the `hs-webview` library providing minimal Haskell bindings
  to the upstream webview C API.
- Demo executable showcasing window creation and inline HTML rendering.
- Nix flake workflow to vendor the required C sources and provide reproducible
  builds across macOS and Linux.
