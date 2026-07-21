# Using OpenOrienteering Mapper on iPadOS

The iPadOS version of OpenOrienteering Mapper is an experimental port intended
for map editing and field work on an iPad. It uses Mapper's touch interface and
can exchange maps and templates through the iPadOS Files app.

> [!IMPORTANT]
> The iPadOS port is not an official App Store release. Keep backup copies of
> your maps and other field-work files, especially before updating or removing
> the app.

## Install Mapper

Mapper must currently be built and signed by a developer before it can be
installed on an iPad. Ask the person or organization providing your build to
install it on your registered device. Developers can follow the
[iPadOS build and deployment instructions](packaging/ios/README.md).

The app may stop opening when its development provisioning profile expires. If
that happens, contact the build provider to sign and install a new build. Do not
delete the old app until you have copied your work out of its Mapper folder.

## Put maps and templates on the iPad

1. Open the **Files** app.
2. Go to **Browse > On My iPad > Mapper**.
3. Copy your map and any related templates into this folder. Keeping each
   project in its own subfolder makes its files easier to manage.
4. Open Mapper, tap **Open map**, and select the map from the Mapper folder.

You can bring files to the iPad with iCloud Drive, AirDrop, an external drive,
or another Files-compatible storage provider. Copy files into the local Mapper
folder before field work if they must remain available without a network
connection.

Mapper's native `.omap` format is recommended for editing. The app can also
open supported OCAD maps and common template formats, but converting a project
can lose details that are not shared by both formats.

## Create and edit a map

- Tap **Create a new map** to choose a scale and one of the bundled symbol sets.
- Mapper always uses its touch interface on iPadOS. The buttons at the top and
  bottom of the map view provide drawing, selection, template, zoom, and
  positioning tools.
- Use the **touch cursor** when you need more precise placement with a finger.
- An Apple Pencil can be used as a pointing and drawing input. Mapper does not
  currently provide Pencil-specific pressure or hover features.
- Close the active map with the close button in the touch toolbar to return to
  the start screen.

For an explanation of the mobile controls, see the
[Touch Mode User Interface](https://www.openorienteering.org/mapper-manual/pages/touch-mode.html).

## Use location and compass features

When prompted, allow Mapper to use **Location While Using the App** and motion
sensors. A georeferenced map is required before Mapper can display your
position correctly.

- The location button displays the iPad's current GNSS position.
- Mapper can record a GPX track next to the open map while location display is
  active.
- The compass button displays device orientation; keep the iPad away from
  magnetic objects if the reading is inaccurate.
- Keep Mapper in the foreground and the screen awake when continuous track
  recording is important. iPadOS may suspend background activity.

GNSS accuracy varies by iPad model and surroundings. Check the displayed
accuracy and do not treat the built-in position as survey-grade data.

## Save, export, and back up your work

Save changes before switching apps or locking the iPad. After a mapping
session:

1. Close the map in Mapper so pending changes are written.
2. Open **Files > On My iPad > Mapper**.
3. Copy the project folder to iCloud Drive, AirDrop it to a computer, or save it
   to another backup location.
4. Include the map, modified templates, and recorded GPX files in the backup.

Files under **On My iPad > Mapper** may be removed when Mapper is uninstalled.
Updating a development build can also put local data at risk, so verify your
backup before an app update or reinstall.

## Current limitations

- This port is experimental and is not distributed through the App Store.
- Installation and updates require a compatible signed build.
- Some desktop-only functions and keyboard-oriented workflows are less
  convenient or unavailable in the touch interface.
- Background GNSS recording is not guaranteed.
- Only one map is shown at a time on iPadOS.

When reporting a problem, include the iPad model, iPadOS version, Mapper commit
or build date, the file format involved, and clear steps that reproduce it.

