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

#include "map_project.h"

#include <algorithm>
#include <cmath>
#include <utility>

#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QSaveFile>
#include <QStandardPaths>
#include <QUuid>

namespace OpenOrienteering {

namespace {

void setError(QString* error, const QString& message)
{
	if (error)
		*error = message;
}

bool isSafeRelativePath(const QString& path)
{
	if (path.isEmpty() || QDir::isAbsolutePath(path))
		return false;

	const auto cleaned = QDir::cleanPath(path);
	return cleaned != QLatin1String("..")
	       && !cleaned.startsWith(QLatin1String("../"))
	       && !cleaned.contains(QLatin1String("/../"));
}

QDateTime readDate(const QJsonObject& json, const QString& key)
{
	return QDateTime::fromString(json.value(key).toString(), Qt::ISODateWithMs);
}

}  // namespace


bool ProjectBounds::isValid() const
{
	if (!defined)
		return true;

	return west >= -180.0 && west <= 180.0
	       && east >= -180.0 && east <= 180.0
	       && south >= -90.0 && south <= 90.0
	       && north >= -90.0 && north <= 90.0
	       && west < east
	       && south < north;
}


bool MapProject::isValid(QString* error) const
{
	if (format_version != current_format_version)
	{
		setError(error, QStringLiteral("Unsupported project format version."));
		return false;
	}
	if (id.trimmed().isEmpty())
	{
		setError(error, QStringLiteral("The project ID is missing."));
		return false;
	}
	if (name.trimmed().isEmpty())
	{
		setError(error, QStringLiteral("The project name is missing."));
		return false;
	}
	if (scale == 0)
	{
		setError(error, QStringLiteral("The project scale is invalid."));
		return false;
	}
	if (!isSafeRelativePath(map_file))
	{
		setError(error, QStringLiteral("The project map path is invalid."));
		return false;
	}
	for (const auto& path : template_files)
	{
		if (!isSafeRelativePath(path))
		{
			setError(error, QStringLiteral("A project template path is invalid."));
			return false;
		}
	}
	if (!created_at.isValid() || !modified_at.isValid())
	{
		setError(error, QStringLiteral("The project timestamps are invalid."));
		return false;
	}
	if (!bounds.isValid())
	{
		setError(error, QStringLiteral("The project geographic bounds are invalid."));
		return false;
	}
	return true;
}


bool MapProject::setLocation(double latitude, double longitude,
	                           double width_km, double height_km, QString* error)
{
	if (latitude < -80.0 || latitude > 84.0 || longitude < -180.0 || longitude > 180.0)
	{
		setError(error, QStringLiteral("The project location is outside the UTM coverage area."));
		return false;
	}
	if (width_km <= 0.0 || height_km <= 0.0 || width_km > 1000.0 || height_km > 1000.0)
	{
		setError(error, QStringLiteral("The project area dimensions are invalid."));
		return false;
	}

	const auto zone = qBound(1, static_cast<int>(std::floor((longitude + 180.0) / 6.0)) + 1, 60);
	const auto epsg = (latitude >= 0.0 ? 32600 : 32700) + zone;
	const auto latitude_radius_km = 111.32;
	const auto longitude_radius_km = latitude_radius_km * std::cos(latitude * M_PI / 180.0);
	const auto half_latitude = height_km / (2.0 * latitude_radius_km);
	const auto half_longitude = width_km / (2.0 * longitude_radius_km);
	ProjectBounds candidate { longitude - half_longitude, latitude - half_latitude,
	                          longitude + half_longitude, latitude + half_latitude, true };
	if (!candidate.isValid())
	{
		setError(error, QStringLiteral("The project area crosses an unsupported geographic boundary."));
		return false;
	}

	bounds = candidate;
	crs_spec = QStringLiteral("EPSG:%1").arg(epsg);
	return true;
}


QJsonObject MapProject::toJson() const
{
	QJsonObject json;
	json.insert(QStringLiteral("formatVersion"), format_version);
	json.insert(QStringLiteral("id"), id);
	json.insert(QStringLiteral("name"), name);
	json.insert(QStringLiteral("presetId"), preset_id);
	json.insert(QStringLiteral("symbolSetId"), symbol_set_id);
	json.insert(QStringLiteral("mapFile"), map_file);
	json.insert(QStringLiteral("scale"), static_cast<int>(scale));
	json.insert(QStringLiteral("crsSpec"), crs_spec);
	json.insert(QStringLiteral("attribution"), attribution);
	json.insert(QStringLiteral("createdAt"), created_at.toUTC().toString(Qt::ISODateWithMs));
	json.insert(QStringLiteral("modifiedAt"), modified_at.toUTC().toString(Qt::ISODateWithMs));

	QJsonArray templates;
	for (const auto& path : template_files)
		templates.append(path);
	json.insert(QStringLiteral("templates"), templates);

	if (bounds.defined)
	{
		QJsonObject bounds_json;
		bounds_json.insert(QStringLiteral("west"), bounds.west);
		bounds_json.insert(QStringLiteral("south"), bounds.south);
		bounds_json.insert(QStringLiteral("east"), bounds.east);
		bounds_json.insert(QStringLiteral("north"), bounds.north);
		json.insert(QStringLiteral("bounds"), bounds_json);
	}

	return json;
}


bool MapProject::fromJson(const QJsonObject& json, MapProject& project, QString* error)
{
	MapProject loaded;
	loaded.format_version = json.value(QStringLiteral("formatVersion")).toInt(-1);
	loaded.id = json.value(QStringLiteral("id")).toString();
	loaded.name = json.value(QStringLiteral("name")).toString();
	loaded.preset_id = json.value(QStringLiteral("presetId")).toString();
	loaded.symbol_set_id = json.value(QStringLiteral("symbolSetId")).toString();
	loaded.map_file = json.value(QStringLiteral("mapFile")).toString();
	loaded.scale = static_cast<unsigned int>(json.value(QStringLiteral("scale")).toInt());
	loaded.crs_spec = json.value(QStringLiteral("crsSpec")).toString();
	loaded.attribution = json.value(QStringLiteral("attribution")).toString();
	loaded.created_at = readDate(json, QStringLiteral("createdAt"));
	loaded.modified_at = readDate(json, QStringLiteral("modifiedAt"));

	const auto templates = json.value(QStringLiteral("templates")).toArray();
	for (const auto& value : templates)
		loaded.template_files.append(value.toString());

	const auto bounds_value = json.value(QStringLiteral("bounds"));
	if (bounds_value.isObject())
	{
		const auto bounds_json = bounds_value.toObject();
		loaded.bounds.west = bounds_json.value(QStringLiteral("west")).toDouble();
		loaded.bounds.south = bounds_json.value(QStringLiteral("south")).toDouble();
		loaded.bounds.east = bounds_json.value(QStringLiteral("east")).toDouble();
		loaded.bounds.north = bounds_json.value(QStringLiteral("north")).toDouble();
		loaded.bounds.defined = true;
	}

	if (!loaded.isValid(error))
		return false;

	project = std::move(loaded);
	return true;
}


ProjectManager::ProjectManager(QString projects_root)
: root(std::move(projects_root))
{
}


QString ProjectManager::defaultProjectsRoot()
{
	return QDir(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation))
	       .filePath(QStringLiteral("Projects"));
}


QString ProjectManager::manifestFileName()
{
	return QStringLiteral("project.json");
}


QString ProjectManager::projectsRoot() const
{
	return root;
}


QString ProjectManager::manifestPath(const QString& project_path) const
{
	return QDir(project_path).filePath(manifestFileName());
}


QString ProjectManager::mapPath(const QString& project_path, const MapProject& project) const
{
	return QDir(project_path).filePath(project.map_file);
}


MapProject ProjectManager::makeProject(const QString& name,
	                                     unsigned int scale,
	                                     const QString& preset_id,
	                                     const QString& symbol_set_id) const
{
	MapProject project;
	project.id = QUuid::createUuid().toString(QUuid::WithoutBraces);
	project.name = name.trimmed();
	project.scale = scale;
	project.preset_id = preset_id;
	project.symbol_set_id = symbol_set_id;
	project.created_at = QDateTime::currentDateTimeUtc();
	project.modified_at = project.created_at;
	return project;
}


bool ProjectManager::createProject(const MapProject& project, QString& project_path, QString* error) const
{
	project_path.clear();
	if (!project.isValid(error))
		return false;

	QDir root_dir(root);
	if (!root_dir.mkpath(QStringLiteral(".")))
	{
		setError(error, QStringLiteral("Unable to create the projects directory."));
		return false;
	}

	if (QFileInfo(root_dir.filePath(project.id)).exists() || !root_dir.mkdir(project.id))
	{
		setError(error, QStringLiteral("Unable to create a unique project directory."));
		return false;
	}

	const auto candidate = root_dir.filePath(project.id);
	QDir project_dir(candidate);
	const QStringList subdirectories {
		QStringLiteral("templates"),
		QStringLiteral("tracks"),
		QStringLiteral("photos"),
		QStringLiteral("backups"),
		QStringLiteral("exports")
	};
	for (const auto& subdirectory : subdirectories)
	{
		if (!project_dir.mkdir(subdirectory))
		{
			project_dir.removeRecursively();
			setError(error, QStringLiteral("Unable to create the project directory structure."));
			return false;
		}
	}

	if (!saveProject(candidate, project, error))
	{
		project_dir.removeRecursively();
		return false;
	}

	project_path = candidate;
	return true;
}


bool ProjectManager::saveProject(const QString& project_path, const MapProject& project, QString* error) const
{
	if (!project.isValid(error))
		return false;

	QFileInfo project_info(project_path);
	if (!project_info.isDir() || !project_info.isWritable())
	{
		setError(error, QStringLiteral("The project directory is not writable."));
		return false;
	}

	QSaveFile file(manifestPath(project_path));
	if (!file.open(QIODevice::WriteOnly))
	{
		setError(error, file.errorString());
		return false;
	}

	const QJsonDocument document(project.toJson());
	if (file.write(document.toJson(QJsonDocument::Indented)) < 0 || !file.commit())
	{
		setError(error, file.errorString());
		return false;
	}
	return true;
}


bool ProjectManager::loadProject(const QString& project_path, MapProject& project, QString* error) const
{
	QFile file(manifestPath(project_path));
	if (!file.open(QIODevice::ReadOnly))
	{
		setError(error, file.errorString());
		return false;
	}

	QJsonParseError parse_error;
	const auto document = QJsonDocument::fromJson(file.readAll(), &parse_error);
	if (parse_error.error != QJsonParseError::NoError || !document.isObject())
	{
		setError(error, QStringLiteral("The project manifest is not valid JSON."));
		return false;
	}
	return MapProject::fromJson(document.object(), project, error);
}


bool ProjectManager::backupProjectMap(const QString& project_path, const MapProject& project,
	                                    int maximum_backups, QString* error) const
{
	if (maximum_backups < 1)
	{
		setError(error, QStringLiteral("The backup retention count is invalid."));
		return false;
	}
	const auto source_path = mapPath(project_path, project);
	if (!QFileInfo::exists(source_path))
	{
		setError(error, QStringLiteral("The project map does not exist."));
		return false;
	}

	QDir backup_dir(QDir(project_path).filePath(QStringLiteral("backups")));
	if (!backup_dir.mkpath(QStringLiteral(".")))
	{
		setError(error, QStringLiteral("Unable to create the project backup directory."));
		return false;
	}
	const auto suffix = QFileInfo(project.map_file).suffix();
	const auto stamp = QDateTime::currentDateTimeUtc().toString(QStringLiteral("yyyyMMdd'T'HHmmsszzz'Z'"));
	const auto filename = QStringLiteral("map-%1.%2").arg(stamp, suffix);
	if (!QFile::copy(source_path, backup_dir.filePath(filename)))
	{
		setError(error, QStringLiteral("Unable to create a project map backup."));
		return false;
	}

	const auto backups = backup_dir.entryInfoList(
	  QStringList{QStringLiteral("map-*.%1").arg(suffix)}, QDir::Files, QDir::Time);
	for (int index = maximum_backups; index < backups.size(); ++index)
		QFile::remove(backups.at(index).filePath());
	return true;
}


QStringList ProjectManager::projectPaths() const
{
	QDir root_dir(root);
	const auto entries = root_dir.entryInfoList(QDir::Dirs | QDir::NoDotAndDotDot,
	                                            QDir::Time | QDir::Reversed);
	QStringList result;
	for (const auto& entry : entries)
	{
		MapProject project;
		if (loadProject(entry.filePath(), project))
			result.append(entry.filePath());
	}
	std::sort(result.begin(), result.end(), [this](const QString& lhs, const QString& rhs) {
		MapProject left;
		MapProject right;
		loadProject(lhs, left);
		loadProject(rhs, right);
		return left.modified_at > right.modified_at;
	});
	return result;
}

}  // namespace OpenOrienteering
