/*
 *    Copyright 2020 Kai Pastor
 *
 *    This file is part of OpenOrienteering.
 *
 *    OpenOrienteering is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    OpenOrienteering is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with OpenOrienteering.  If not, see <http://www.gnu.org/licenses/>.
 */


#include "scaling_icon_engine_plugin.h"

#include <QIconEnginePlugin>

#include "scaling_icon_engine.h"

namespace OpenOrienteering {

ScalingIconEnginePlugin::~ScalingIconEnginePlugin() = default;

ScalingIconEnginePlugin::ScalingIconEnginePlugin(QObject* parent)
: QIconEnginePlugin(parent)
{}

QIconEngine* ScalingIconEnginePlugin::create(const QString& filename)
{
	// ScalingIconEngine's constructor populates its inner QIcon via
	// QIcon::addFile, which may route back to this plugin (since Qt 6.7,
	// QIcon defers engine creation, and a null engine is discarded after
	// each addFile). Returning nullptr on re-entry makes Qt fall back to
	// its internal pixmap engine, avoiding infinite recursion.
	static thread_local bool creating = false;
	if (creating)
		return nullptr;
	creating = true;
	auto* engine = new ScalingIconEngine(filename);
	creating = false;
	return engine;
}


}  // namespace OpenOrienteering
