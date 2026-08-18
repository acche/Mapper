#!/usr/bin/env bash
set -euo pipefail

# Configuration for TestFlight distribution
BUNDLE_ID="${BUNDLE_ID:-net.aswift.mapper}"
APP_NAME="${APP_NAME:-Mapper}"
VERSION="${VERSION:-1.0.0}"
BUILD_NUMBER="${BUILD_NUMBER:-$(date +%Y%m%d%H%M)}"

API_KEY_ID="B3446YAABA"
API_ISSUER_ID="69a6de97-6bbd-47e3-e053-5b8c7c11a4d1"

BUILD_DIR="/Users/ac/Dev/aibox/app/open-orienteering-map/ios-build/mapper-ipados-device"
APP_DIR="${BUILD_DIR}/src/Mapper.app"
IPA_DIR="${BUILD_DIR}/ipa"
IPA_PATH="${IPA_DIR}/${APP_NAME}.ipa"

echo "=== 1. Checking build artifacts ==="
if [ ! -d "${APP_DIR}" ]; then
    echo "Error: ${APP_DIR} not found. Please build the project first."
    exit 1
fi

mkdir -p "${IPA_DIR}"
rm -rf "${IPA_DIR}/Payload" "${IPA_PATH}"
mkdir -p "${IPA_DIR}/Payload"

echo "=== 2. Finding Apple Distribution signing identity and Provisioning Profile ==="
SIGNING_IDENTITY=$(security find-identity -p codesigning -v | grep "Apple Distribution" | head -n 1 | awk -F'"' '{print $2}' || true)

if [ -z "${SIGNING_IDENTITY}" ]; then
    echo "Error: No 'Apple Distribution' certificate found in Keychain."
    echo "Please open Xcode -> Settings -> Accounts -> Manage Certificates -> '+' -> Apple Distribution."
    exit 1
fi

echo "Using Signing Identity: ${SIGNING_IDENTITY}"

# Find App Store provisioning profile for net.aswift.mapper
PROVISIONING_PROFILE=""
for p in "${BUILD_DIR}/"*.mobileprovision /Users/ac/Dev/aibox/app/open-orienteering-map/mapper-ipados/*.mobileprovision ~/Downloads/*.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/*.mobileprovision; do
    if [ -f "$p" ]; then
        if security cms -D -i "$p" 2>/dev/null | grep -q "net.aswift.mapper"; then
            PROVISIONING_PROFILE="$p"
            echo "Found matching Provisioning Profile: ${PROVISIONING_PROFILE}"
            break
        fi
    fi
done

if [ -z "${PROVISIONING_PROFILE}" ]; then
    # Try any valid distribution mobileprovision in the project or downloads
    for p in /Users/ac/Dev/aibox/app/open-orienteering-map/mapper-ipados/*.mobileprovision ~/Downloads/*.mobileprovision; do
        if [ -f "$p" ]; then
            PROVISIONING_PROFILE="$p"
            echo "Using found Provisioning Profile: ${PROVISIONING_PROFILE}"
            break
        fi
    done
fi

echo "=== 3. Packaging .ipa archive and AppIcon assets ==="
cp -R "${APP_DIR}" "${IPA_DIR}/Payload/"

# Generate complete AppIcon assets and compile Assets.car with actool
ICON_WORK_DIR="/tmp/mapper_app_icons"
rm -rf "${ICON_WORK_DIR}"
mkdir -p "${ICON_WORK_DIR}/Assets.xcassets/AppIcon.appiconset" "${ICON_WORK_DIR}/compiled"

SRC_ICNS="/Users/ac/Dev/aibox/app/open-orienteering-map/mapper-ipados/images/mapper-icon/Mapper.icns"
sips -s format png "${SRC_ICNS}" --resampleHeightWidth 1024 1024 --out "${ICON_WORK_DIR}/icon_raw.png" >/dev/null
sips -s format jpeg "${ICON_WORK_DIR}/icon_raw.png" --out "${ICON_WORK_DIR}/icon_1024.jpg" >/dev/null
sips -s format png "${ICON_WORK_DIR}/icon_1024.jpg" --out "${ICON_WORK_DIR}/icon_1024.png" >/dev/null

python3 -c "
import subprocess, json

work_dir = '/tmp/mapper_app_icons'
sizes = [
    (1024, '1024x1024', 'ios-marketing', '1x', 'icon_1024.png'),
    (152, '76x76', 'ipad', '2x', 'icon_152.png'),
    (167, '83.5x83.5', 'ipad', '2x', 'icon_167.png'),
    (76, '76x76', 'ipad', '1x', 'icon_76.png'),
    (120, '60x60', 'iphone', '2x', 'icon_120.png'),
    (180, '60x60', 'iphone', '3x', 'icon_180.png'),
    (40, '20x20', 'ipad', '2x', 'icon_40.png'),
    (20, '20x20', 'ipad', '1x', 'icon_20.png'),
    (58, '29x29', 'ipad', '2x', 'icon_58.png'),
    (29, '29x29', 'ipad', '1x', 'icon_29.png'),
    (80, '40x40', 'ipad', '2x', 'icon_80.png'),
]

images_json = []
for px, sz, idiom, scale, fname in sizes:
    subprocess.run(['sips', '-z', str(px), str(px), f'{work_dir}/icon_1024.png', '--out', f'{work_dir}/Assets.xcassets/AppIcon.appiconset/{fname}'], check=True, stdout=subprocess.DEVNULL)
    images_json.append({'size': sz, 'idiom': idiom, 'filename': fname, 'scale': scale})

with open(f'{work_dir}/Assets.xcassets/AppIcon.appiconset/Contents.json', 'w') as f:
    json.dump({'images': images_json, 'info': {'version': 1, 'author': 'xcode'}}, f, indent=2)
"

xcrun actool --compile "${IPA_DIR}/Payload/Mapper.app" \
    --platform iphoneos \
    --minimum-deployment-target 17.0 \
    --app-icon AppIcon \
    --output-partial-info-plist "${ICON_WORK_DIR}/partial_info.plist" \
    "${ICON_WORK_DIR}/Assets.xcassets" >/dev/null

cp "${ICON_WORK_DIR}/Assets.xcassets/AppIcon.appiconset/"*.png "${IPA_DIR}/Payload/Mapper.app/"

if [ -n "${PROVISIONING_PROFILE}" ]; then
    cp "${PROVISIONING_PROFILE}" "${IPA_DIR}/Payload/Mapper.app/embedded.mobileprovision"
    # Extract entitlements
    security cms -D -i "${PROVISIONING_PROFILE}" > "${IPA_DIR}/profile.plist"
    /usr/libexec/PlistBuddy -x -c "Print :Entitlements" "${IPA_DIR}/profile.plist" > "${IPA_DIR}/entitlements.plist"
fi

# Get environment versions
SDK_VERSION=$(xcrun --sdk iphoneos --show-sdk-version)
SDK_BUILD=$(xcrun --sdk iphoneos --show-sdk-build-version)
XCODE_BUILD=$(xcodebuild -version | grep "Build version" | awk '{print $3}')
XCODE_VER_NUM=$(xcodebuild -version | head -n 1 | awk '{print $2}' | tr -d '.' | awk '{printf "%s0", $1}')
MAC_BUILD=$(sw_vers -buildVersion)

PLIST="${IPA_DIR}/Payload/Mapper.app/Info.plist"

# Update Bundle ID, names, encryption exemption, and version in Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${BUNDLE_ID}" "${PLIST}" 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Add :CFBundleIdentifier string ${BUNDLE_ID}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName omapper" "${PLIST}" 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Add :CFBundleDisplayName string omapper" "${PLIST}"

/usr/libexec/PlistBuddy -c "Set :CFBundleName omapper" "${PLIST}" 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Add :CFBundleName string omapper" "${PLIST}"

/usr/libexec/PlistBuddy -c "Set :ITSAppUsesNonExemptEncryption false" "${PLIST}" 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Add :ITSAppUsesNonExemptEncryption bool false" "${PLIST}"

/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${VERSION}" "${PLIST}" 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Add :CFBundleShortVersionString string ${VERSION}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${BUILD_NUMBER}" "${PLIST}" 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Add :CFBundleVersion string ${BUILD_NUMBER}" "${PLIST}"

# Inject DT build environment tags required by App Store Connect
/usr/libexec/PlistBuddy -c "Delete :DTPlatformName" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :DTPlatformName string iphoneos" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :DTPlatformVersion" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :DTPlatformVersion string ${SDK_VERSION}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :DTSDKName" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :DTSDKName string iphoneos${SDK_VERSION}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :DTSDKBuild" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :DTSDKBuild string ${SDK_BUILD}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :DTPlatformBuild" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :DTPlatformBuild string ${SDK_BUILD}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :DTXcode" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :DTXcode string ${XCODE_VER_NUM}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :DTXcodeBuild" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :DTXcodeBuild string ${XCODE_BUILD}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :DTCompiler" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :DTCompiler string com.apple.compilers.llvm.clang.1_0" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :BuildMachineOSBuild" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :BuildMachineOSBuild string ${MAC_BUILD}" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :CFBundleSupportedPlatforms" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms array" "${PLIST}"
/usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms:0 string iPhoneOS" "${PLIST}"

/usr/libexec/PlistBuddy -c "Delete :UIRequiredDeviceCapabilities" "${PLIST}" 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Add :UIRequiredDeviceCapabilities array" "${PLIST}"
/usr/libexec/PlistBuddy -c "Add :UIRequiredDeviceCapabilities:0 string arm64" "${PLIST}"

# Resign payload
if [ -f "${IPA_DIR}/entitlements.plist" ]; then
    codesign --force --deep --sign "${SIGNING_IDENTITY}" --entitlements "${IPA_DIR}/entitlements.plist" "${IPA_DIR}/Payload/Mapper.app"
else
    codesign --force --deep --sign "${SIGNING_IDENTITY}" "${IPA_DIR}/Payload/Mapper.app"
fi

cd "${IPA_DIR}"
zip -qr "${IPA_PATH}" Payload
echo "Created: ${IPA_PATH}"

echo "=== 4. Validating / Uploading to TestFlight ==="
echo "Running validation against App Store Connect..."
xcrun altool --validate-app \
    -f "${IPA_PATH}" \
    -t ios \
    --apiKey "${API_KEY_ID}" \
    --apiIssuer "${API_ISSUER_ID}"

echo "Uploading to TestFlight..."
xcrun altool --upload-app \
    -f "${IPA_PATH}" \
    -t ios \
    --apiKey "${API_KEY_ID}" \
    --apiIssuer "${API_ISSUER_ID}"

echo "=== Upload to TestFlight Complete! ==="
