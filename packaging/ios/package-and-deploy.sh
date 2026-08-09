#!/bin/zsh
# Package Mapper.app for iOS device: plist keys, icons, data, sign, install
set -e
ROOT=/Users/ac/Dev/aibox/app/open-orienteering-map
APP=$ROOT/ios-build/mapper-dev/src/Mapper.app
BUILD=$ROOT/ios-build/mapper-dev
PROFILE="$HOME/Library/Developer/Xcode/UserData/Provisioning Profiles/023f2920-4a11-4da4-8214-41a4891af114.mobileprovision"
IDENTITY="Apple Development: YOUR_NAME (YOUR_TEAM_ID)"
DEVICE=YOUR_DEVICE_UDID

# Info.plist iOS keys
P=$APP/Info.plist
plutil -replace LSRequiresIPhoneOS -bool true "$P"
plutil -replace UIDeviceFamily -json '[2]' "$P"
plutil -replace MinimumOSVersion -string "17.0" "$P"
plutil -replace UILaunchScreen -json '{}' "$P"
plutil -replace UIFileSharingEnabled -bool true "$P"
plutil -replace LSSupportsOpeningDocumentsInPlace -bool true "$P"
plutil -replace UISupportedInterfaceOrientations -json '["UIInterfaceOrientationPortrait","UIInterfaceOrientationLandscapeLeft","UIInterfaceOrientationLandscapeRight","UIInterfaceOrientationPortraitUpsideDown"]' "$P"
plutil -replace NSLocationWhenInUseUsageDescription -string "Mapper uses your location to show your position on the map and record GPS tracks." "$P"
plutil -replace NSMotionUsageDescription -string "Mapper uses motion sensors for the compass display." "$P"
plutil -replace CFBundleIcons -json '{"CFBundlePrimaryIcon":{"CFBundleIconFiles":["AppIcon60x60"],"CFBundleIconName":"AppIcon"}}' "$P"
plutil -replace 'CFBundleIcons~ipad' -json '{"CFBundlePrimaryIcon":{"CFBundleIconFiles":["AppIcon60x60","AppIcon76x76"],"CFBundleIconName":"AppIcon"}}' "$P"

# Icons
cp $ROOT/ios-build/icon/AppIcon60x60@2x.png "$APP/"
cp $ROOT/ios-build/icon/AppIcon76x76@2x~ipad.png "$APP/"
cp $ROOT/ios-build/icon/AppIcon83.5x83.5@2x~ipad.png "$APP/"

# Data: symbol sets + translations + licensing docs
mkdir -p "$APP/data/symbol sets" "$APP/data/translations" "$APP/data/doc"
# Preserve scale subdirectories (4000/, 10000/, ...), which the new-project
# catalog uses to resolve the bundled symbol sets.
rsync -a --include='*/' --include='*.omap' --exclude='*' \
  "$ROOT/mapper/symbol sets/" "$APP/data/symbol sets/"
cp "$BUILD/translations"/*.qm "$APP/data/translations/" 2>/dev/null || true

# PROJ + GDAL runtime data
mkdir -p "$APP/data/proj" "$APP/data/gdal"
cp $ROOT/ios-build/deps-dev/share/proj/proj.db "$APP/data/proj/"
cp $ROOT/ios-build/deps-dev/share/proj/proj.ini "$APP/data/proj/" 2>/dev/null || true
cp -R $ROOT/ios-build/deps-dev/share/gdal/ "$APP/data/gdal/" 2>/dev/null || true
cp "$ROOT/mapper/src/gdal/mapper-osmconf.ini" "$APP/data/gdal/" 2>/dev/null || true

# Provisioning + signing
cp "$PROFILE" "$APP/embedded.mobileprovision"
codesign --force --sign "$IDENTITY" --entitlements $ROOT/ios-build/entitlements.plist "$APP"
codesign --verify --verbose=2 "$APP"

# Install to device
xcrun devicectl device install app --device $DEVICE "$APP"
