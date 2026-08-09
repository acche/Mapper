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

#ifndef OPENORIENTEERING_MAP_PROJECT_T_H
#define OPENORIENTEERING_MAP_PROJECT_T_H

#include <QObject>

class MapProjectTest : public QObject
{
	Q_OBJECT

private slots:
	void manifestRoundTrip();
	void createsProjectLayout();
	void rejectsUnsafePaths();
	void rejectsMalformedManifest();
	void calculatesProjectLocation();
	void createsAndPrunesBackups();
};

#endif
