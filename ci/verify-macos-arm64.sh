#!/bin/bash

# Verify that an application bundle can run without Rosetta.  Checking only
# Mapper is insufficient: every bundled framework, plug-in, and helper must
# contain an arm64 slice as well.

set -euo pipefail

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 <Mapper.app|Mapper.dmg>" >&2
	exit 2
fi

input=$1
mount_point=

cleanup()
{
	if [[ -n "${mount_point}" ]]; then
		hdiutil detach "${mount_point}" -quiet || true
		rmdir "${mount_point}" 2>/dev/null || true
	fi
}
trap cleanup EXIT

case "${input}" in
	*.app)
		app=${input}
		;;
	*.dmg)
		mount_point=$(mktemp -d "${TMPDIR:-/tmp}/mapper-dmg.XXXXXX")
		# Release images contain the GPL as a software license agreement.
		# Accept it non-interactively so the same check works in CI.
		printf 'Y\n' | hdiutil attach -readonly -nobrowse -mountpoint "${mount_point}" "${input}" >/dev/null
		app=$(find "${mount_point}" -maxdepth 2 -type d -name 'Mapper.app' -print -quit)
		;;
	*)
		echo "Unsupported input: ${input}" >&2
		exit 2
		;;
esac

if [[ -z "${app:-}" || ! -d "${app}" ]]; then
	echo "Mapper.app not found in ${input}" >&2
	exit 1
fi

main_executable="${app}/Contents/MacOS/Mapper"
if [[ ! -f "${main_executable}" ]]; then
	echo "Mapper executable not found in ${app}" >&2
	exit 1
fi

checked=0
failed=0
while IFS= read -r -d '' candidate; do
	if file -b "${candidate}" | grep -q 'Mach-O'; then
		checked=$((checked + 1))
		architectures=$(lipo -archs "${candidate}")
		case " ${architectures} " in
		*' arm64 '*) ;;
		*)
			echo "Missing arm64 slice: ${candidate#"${app}/"} (${architectures})" >&2
			failed=1
			;;
		esac
	fi
done < <(find "${app}" -type f -print0)

if [[ ${checked} -eq 0 ]]; then
	echo "No Mach-O binaries found in ${app}" >&2
	exit 1
fi
if [[ ${failed} -ne 0 ]]; then
	exit 1
fi

if ! codesign --verify --deep --strict "${app}"; then
	echo "Invalid code signature in ${app}" >&2
	exit 1
fi

echo "Verified ${checked} signed Mach-O binaries in $(basename "${input}"): all contain arm64"
