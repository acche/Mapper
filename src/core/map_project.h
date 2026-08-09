/*
 *    Copyright 2026 Chen Chen
 *
 *    This file is part of OpenOrienteering.
 *
 *    OpenOrienteering is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 */

#ifndef OPENORIENTEERING_MAP_PROJECT_H
#define OPENORIENTEERING_MAP_PROJECT_H

#include <QDateTime>
#include <QString>
#include <QStringList>

class QJsonObject;

namespace OpenOrienteering {

/** Geographic bounds of a tablet-created mapping project. */
struct ProjectBounds
{
	double west = 0.0;
	double south = 0.0;
	double east = 0.0;
	double north = 0.0;
	bool defined = false;

	bool isValid() const;
};


/**
 * Metadata which turns a map and its auxiliary files into a portable project.
 *
 * Paths in the manifest are always relative to the project directory. The
 * native .omap format remains unchanged and can still be opened on its own.
 */
class MapProject
{
public:
	static constexpr int current_format_version = 1;

	int format_version = current_format_version;
	QString id;
	QString name;
	QString preset_id;
	QString symbol_set_id;
	QString map_file = QStringLiteral("map.omap");
	QString crs_spec;
	QString attribution;
	QStringList template_files;
	unsigned int scale = 0;
	QDateTime created_at;
	QDateTime modified_at;
	ProjectBounds bounds;

	/** Sets WGS84 bounds and the matching WGS84 UTM CRS for a project area. */
	bool setLocation(double latitude, double longitude,
	                 double width_km, double height_km, QString* error = nullptr);

	/** Returns true when all mandatory metadata is valid and paths are safe. */
	bool isValid(QString* error = nullptr) const;

	/** Serializes the manifest. */
	QJsonObject toJson() const;

	/** Loads a manifest, rejecting unsupported or malformed data. */
	static bool fromJson(const QJsonObject& json, MapProject& project, QString* error = nullptr);
};


/** Creates, loads and stores app-managed mapping projects. */
class ProjectManager
{
public:
	explicit ProjectManager(QString projects_root = defaultProjectsRoot());

	static QString defaultProjectsRoot();
	static QString manifestFileName();

	QString projectsRoot() const;
	QString manifestPath(const QString& project_path) const;
	QString mapPath(const QString& project_path, const MapProject& project) const;

	/** Returns initialized metadata with a new UUID and timestamps. */
	MapProject makeProject(const QString& name,
	                       unsigned int scale,
	                       const QString& preset_id,
	                       const QString& symbol_set_id) const;

	/**
	 * Creates the project directory and standard subdirectories, then atomically
	 * writes the manifest. No map file is created by this operation.
	 */
	bool createProject(const MapProject& project, QString& project_path, QString* error = nullptr) const;

	/** Atomically writes project.json. */
	bool saveProject(const QString& project_path, const MapProject& project, QString* error = nullptr) const;

	/** Reads and validates project.json. */
	bool loadProject(const QString& project_path, MapProject& project, QString* error = nullptr) const;

	/** Copies the current map into backups/ and keeps only the newest copies. */
	bool backupProjectMap(const QString& project_path, const MapProject& project,
	                      int maximum_backups = 10, QString* error = nullptr) const;

	/** Returns valid project directories, newest first. */
	QStringList projectPaths() const;

private:
	QString root;
};

}  // namespace OpenOrienteering

#endif
