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

## Create a complete mapping project on the iPad

No desktop computer or pre-existing map file is required.

1. Open Mapper and tap **Create a new mapping project**.
2. Enter a project name and choose the map type. The map type supplies the
   initial map scale and bundled symbol set, for example ISSprOM for a sprint
   map or ISOM for a forest map.
3. To initialize georeferencing, enable **Set the mapping area now**. Enter a
   WGS84 latitude and longitude, or tap **Use current location**, then set the
   approximate width and height of the mapping area. Mapper creates a suitable
   UTM coordinate reference system for the location.
4. Leave **Import a base map after creating the project** enabled if imagery or
   another map is ready in the Files app.
5. Tap **Create project**. Mapper creates the project directory, initializes
   the `.omap` file with the selected symbol set, and saves it automatically.
6. If base-map import was enabled, choose the image or map in the iPadOS file
   picker and complete the positioning dialog described below.

The project is listed on Mapper's start screen. A managed project keeps its
map, templates, tracks, photos, backups, exports, and `project.json` manifest
together so it can later be exported as one folder.

## Import a complete OpenOrienteering Mapper project

Use this workflow for a project exported by this iPadOS version of Mapper. A
complete project is normally a folder ending in `.mapperproject`; it contains
`project.json`, the `.omap` map, and any project templates or other resources.

1. Put the `.mapperproject` folder in **Files** using iCloud Drive, AirDrop, an
   external drive, or another Files-compatible provider. Download cloud-only
   files before going offline.
2. Open Mapper and tap **Import a mapping project**.
3. Select the project folder itself, not only the `.omap` file inside it.
4. Mapper verifies that the map and referenced templates are present, copies
   the complete project into its managed local storage, assigns a new internal
   project ID, and opens the map.

If you only have a standalone `.omap` or supported OCAD map, use **Open map ...**
instead. Opening one file does not turn it into a self-contained managed
project and does not automatically collect its external templates.

Mapper's native `.omap` format is recommended for editing. Importing an OCAD
map may lose details that are not shared by both formats.

## Import and position a base map

When creating a project, keep **Import a base map after creating the project**
enabled to open the file picker automatically. To add another base map later:

1. Open the **Templates** panel from the touch toolbar.
2. Tap **+**, then tap **Open base map...**.
3. Select a supported raster image, GeoTIFF, map, or other template file from
   Files.
4. Choose how Mapper should position the image:
   - Select **Georeferenced (GeoTIFF)** when the file contains valid geographic
     coordinates. Confirm the coordinate reference system if Mapper asks.
   - Select **Meters per pixel** for a digital image with a known ground
     resolution.
   - Select **Scanned with ... dpi** and enter the template scale for a scanned
     paper map.
5. Tap **Open**. Mapper copies the selected file into the managed project's
   `templates` directory, makes the template visible, closes the Templates
   panel, and zooms the editing view to the imported base map.

GeoTIFF is the preferred format when geographic alignment must be preserved.
For a georeferenced project, Mapper transforms a GeoTIFF from its source CRS
into the map CRS. Review the result before drawing; incorrect or missing CRS
metadata cannot be corrected reliably without known reference information.

The Templates panel can be reopened to change visibility or opacity. Tap the
bottom **Close** button to return to the full editing view.

## Edit the map

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

Save changes before switching apps or locking the iPad. To make a portable
backup of a managed project:

1. Tap **Save** in the touch toolbar.
2. Tap **Export complete project...**.
3. Choose a destination in Files, such as **On My iPad**, iCloud Drive, an
   external drive, or another Files-compatible provider.
4. Mapper creates a folder named `<project name>.mapperproject`. This folder
   contains the map, imported templates, tracks, photos, backups, exports, and
   the project manifest.
5. Confirm that the exported folder is available in Files before updating or
   removing Mapper. The folder can be imported on another iPad with **Import a
   mapping project**.

Mapper's internal managed-project storage may be removed when the app is
uninstalled. Updating a development build can also put local data at risk, so
verify the exported backup before an app update or reinstall.

## Current limitations

- This port is experimental and is not distributed through the App Store.
- Installation and updates require a compatible signed build.
- Some desktop-only functions and keyboard-oriented workflows are less
  convenient or unavailable in the touch interface.
- Background GNSS recording is not guaranteed.
- Only one map is shown at a time on iPadOS.

When reporting a problem, include the iPad model, iPadOS version, Mapper commit
or build date, the file format involved, and clear steps that reproduce it.
