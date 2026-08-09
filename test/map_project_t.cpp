/*
 *    Copyright 2026 Chen Chen
 *
 *    This file is part of OpenOrienteering.
 *
 *    OpenOrienteering is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 */

#include "map_project_t.h"

#include <QDir>
#include <QFile>
#include <QTemporaryDir>
#include <QtTest>

#include "core/map_project.h"

using namespace OpenOrienteering;

void MapProjectTest::manifestRoundTrip()
{
	ProjectManager manager(QStringLiteral("unused"));
	auto input = manager.makeProject(QStringLiteral("Campus map"), 4000,
	                                 QStringLiteral("sprint"),
	                                 QStringLiteral("ISSprOM 2019_4000.omap"));
	input.crs_spec = QStringLiteral("EPSG:32650");
	input.attribution = QStringLiteral("Example data source");
	input.template_files << QStringLiteral("templates/base.osm");
	input.bounds = { 116.1, 39.8, 116.2, 39.9, true };

	MapProject output;
	QString error;
	QVERIFY2(MapProject::fromJson(input.toJson(), output, &error), qPrintable(error));
	QCOMPARE(output.id, input.id);
	QCOMPARE(output.name, input.name);
	QCOMPARE(output.scale, input.scale);
	QCOMPARE(output.preset_id, input.preset_id);
	QCOMPARE(output.symbol_set_id, input.symbol_set_id);
	QCOMPARE(output.crs_spec, input.crs_spec);
	QCOMPARE(output.attribution, input.attribution);
	QCOMPARE(output.template_files, input.template_files);
	QCOMPARE(output.bounds.west, input.bounds.west);
	QCOMPARE(output.bounds.north, input.bounds.north);
}

void MapProjectTest::createsProjectLayout()
{
	QTemporaryDir temporary;
	QVERIFY(temporary.isValid());
	ProjectManager manager(temporary.path());
	auto input = manager.makeProject(QStringLiteral("Forest map"), 10000,
	                                 QStringLiteral("forest"),
	                                 QStringLiteral("ISOM 2017-2_10000.omap"));

	QString project_path;
	QString error;
	QVERIFY2(manager.createProject(input, project_path, &error), qPrintable(error));
	QVERIFY(QFileInfo(manager.manifestPath(project_path)).isFile());
	QVERIFY(QFileInfo(QDir(project_path).filePath(QStringLiteral("templates"))).isDir());
	QVERIFY(QFileInfo(QDir(project_path).filePath(QStringLiteral("tracks"))).isDir());
	QVERIFY(QFileInfo(QDir(project_path).filePath(QStringLiteral("photos"))).isDir());
	QVERIFY(QFileInfo(QDir(project_path).filePath(QStringLiteral("backups"))).isDir());
	QVERIFY(QFileInfo(QDir(project_path).filePath(QStringLiteral("exports"))).isDir());

	MapProject loaded;
	QVERIFY2(manager.loadProject(project_path, loaded, &error), qPrintable(error));
	QCOMPARE(loaded.id, input.id);
	QCOMPARE(manager.projectPaths(), QStringList{project_path});
}

void MapProjectTest::rejectsUnsafePaths()
{
	ProjectManager manager(QStringLiteral("unused"));
	auto project = manager.makeProject(QStringLiteral("Unsafe"), 4000,
	                                   QStringLiteral("sprint"), QString());
	project.map_file = QStringLiteral("../outside.omap");
	QVERIFY(!project.isValid());

	project.map_file = QStringLiteral("map.omap");
	project.template_files << QStringLiteral("/absolute/template.tif");
	QVERIFY(!project.isValid());
}

void MapProjectTest::rejectsMalformedManifest()
{
	QTemporaryDir temporary;
	QVERIFY(temporary.isValid());
	ProjectManager manager(temporary.path());
	const auto project_path = QDir(temporary.path()).filePath(QStringLiteral("broken"));
	QVERIFY(QDir().mkpath(project_path));
	QFile file(manager.manifestPath(project_path));
	QVERIFY(file.open(QIODevice::WriteOnly));
	QVERIFY(file.write("not json") > 0);
	file.close();

	MapProject project;
	QVERIFY(!manager.loadProject(project_path, project));
}

void MapProjectTest::calculatesProjectLocation()
{
	ProjectManager manager(QStringLiteral("unused"));
	auto project = manager.makeProject(QStringLiteral("Located map"), 4000,
	                                   QStringLiteral("sprint"), QString());
	QString error;
	QVERIFY2(project.setLocation(39.9042, 116.4074, 4.0, 3.0, &error), qPrintable(error));
	QCOMPARE(project.crs_spec, QStringLiteral("EPSG:32650"));
	QVERIFY(project.bounds.defined);
	QVERIFY(project.bounds.west < 116.4074);
	QVERIFY(project.bounds.east > 116.4074);

	QVERIFY(project.setLocation(-33.8688, 151.2093, 4.0, 3.0, &error));
	QCOMPARE(project.crs_spec, QStringLiteral("EPSG:32756"));
	QVERIFY(!project.setLocation(86.0, 10.0, 4.0, 3.0, &error));
}

void MapProjectTest::createsAndPrunesBackups()
{
	QTemporaryDir temporary;
	QVERIFY(temporary.isValid());
	ProjectManager manager(temporary.path());
	auto project = manager.makeProject(QStringLiteral("Backup map"), 4000,
	                                   QStringLiteral("sprint"), QString());
	QString project_path;
	QString error;
	QVERIFY2(manager.createProject(project, project_path, &error), qPrintable(error));

	QFile map_file(manager.mapPath(project_path, project));
	QVERIFY(map_file.open(QIODevice::WriteOnly));
	QVERIFY(map_file.write("version one") > 0);
	map_file.close();
	QVERIFY2(manager.backupProjectMap(project_path, project, 2, &error), qPrintable(error));
	QTest::qSleep(2);
	QVERIFY2(manager.backupProjectMap(project_path, project, 2, &error), qPrintable(error));
	QTest::qSleep(2);
	QVERIFY2(manager.backupProjectMap(project_path, project, 2, &error), qPrintable(error));

	QDir backup_dir(QDir(project_path).filePath(QStringLiteral("backups")));
	QCOMPARE(backup_dir.entryList(QStringList{QStringLiteral("map-*.omap")}, QDir::Files).size(), 2);
}

QTEST_GUILESS_MAIN(MapProjectTest)

#include "moc_map_project_t.cpp"
