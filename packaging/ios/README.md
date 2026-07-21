# Building Mapper for iPad (iOS)

This directory contains the scripts used to build, sign and deploy Mapper to an
iPad for personal/team use (GPLv3 prevents App Store distribution).

## Prerequisites

- Xcode with iOS SDK
- CMake ≥ 3.20, Ninja
- Qt 6.11.x **for iOS** (e.g. via `aqt install-qt mac ios 6.11.1 -m qtsensors qtpositioning qt5compat qtimageformats`)
- Qt 6.11.x **for macOS** of the same version (host tools; e.g. Homebrew `qt`)
- An Apple Development signing identity + a provisioning profile covering the
  target device (Xcode's automatic "iOS Team Provisioning Profile: *" works)

## Layout assumed by the scripts

```
<workspace>/
  mapper/            this repository
  qt-ios/6.11.1/ios  Qt for iOS
  proj-9.6.2/        PROJ source
  gdal-3.9.3/        GDAL source (frmts/png/libpng needs the TARGET_OS_MAC
                     fp.h include removed for iOS, see build notes)
  ios-build/         build trees and installed deps (created by the scripts)
```

Edit the path/identity variables at the top of each script, then run in order:

1. `build-proj-dev.sh` – cross-compile PROJ (static, no curl/tiff)
2. `build-gdal-dev.sh` – cross-compile GDAL (static; GTiff/PNG/JPEG raster,
   DXF/Shapefile vector; internal libtiff/libjpeg/libpng, SDK zlib)
3. `configure-mapper-dev.sh` – configure Mapper with the Qt iOS toolchain
   (`qt.toolchain.cmake` + `QT_HOST_PATH`), then `cmake --build`
4. `package-and-deploy.sh` – add iOS Info.plist keys, icons, bundled data
   (symbol sets, translations, proj.db, GDAL data), sign, install via
   `devicectl`

## Architecture notes

- Official Qt iOS binaries are fat archives: **arm64 slice = device,
  x86_64 slice = simulator**. Simulator builds must use
  `CMAKE_OSX_ARCHITECTURES=x86_64` (Rosetta on Apple Silicon).
- The app bundle is flat (no `Contents/`); resources live in
  `Mapper.app/data/…`, found via the `Q_OS_IOS` branch in
  `src/mapper_resource.cpp`.
- File exchange uses the Files app ("On My iPad → Mapper") via
  `UIFileSharingEnabled` + `LSSupportsOpeningDocumentsInPlace`.

## Keeping in sync with upstream

iOS-specific changes are intentionally structured like the Android port:
`if(IOS)` CMake branches parallel to `if(ANDROID)`, and
`Q_OS_IOS` conditionals next to `Q_OS_ANDROID`. To update:

```
git fetch upstream
git merge upstream/master   # on the qt6-port branch
```

Conflicts should be limited to the same few files touched here.
