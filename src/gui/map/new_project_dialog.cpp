/*
 *    Copyright 2026 Chen Chen
 *
 *    This file is part of OpenOrienteering.
 */

#include "new_project_dialog.h"

#include <QCheckBox>
#include <QDate>
#include <QDialogButtonBox>
#include <QDoubleSpinBox>
#include <QFormLayout>
#include <QLabel>
#include <QLineEdit>
#include <QPushButton>
#include <QVBoxLayout>

#if defined(QT_POSITIONING_LIB)
#  include <QGeoCoordinate>
#  include <QGeoPositionInfo>
#  include <QGeoPositionInfoSource>
#endif

#include "core/app_permissions.h"

namespace OpenOrienteering {

NewProjectDialog::NewProjectDialog(QWidget* parent)
: QDialog(parent, Qt::WindowSystemMenuHint | Qt::WindowTitleHint)
, name_edit(new QLineEdit(this))
, location_check(new QCheckBox(tr("Set the mapping area now"), this))
, latitude_edit(new QDoubleSpinBox(this))
, longitude_edit(new QDoubleSpinBox(this))
, width_edit(new QDoubleSpinBox(this))
, height_edit(new QDoubleSpinBox(this))
, current_location_button(new QPushButton(tr("Use current location"), this))
, import_base_map_check(new QCheckBox(tr("Import a base map after creating the project"), this))
, position_source(nullptr)
, buttons(new QDialogButtonBox(QDialogButtonBox::Cancel | QDialogButtonBox::Ok, this))
{
	setWindowTitle(tr("Create mapping project"));
	setMinimumWidth(420);

	name_edit->setText(tr("Map %1").arg(QDate::currentDate().toString(Qt::ISODate)));
	name_edit->selectAll();

	auto* form = new QFormLayout();
	form->addRow(tr("Project name:"), name_edit);
	form->addRow(location_check);
	latitude_edit->setRange(-80.0, 84.0);
	longitude_edit->setRange(-180.0, 180.0);
	latitude_edit->setDecimals(6);
	longitude_edit->setDecimals(6);
	width_edit->setRange(0.1, 1000.0);
	height_edit->setRange(0.1, 1000.0);
	width_edit->setValue(4.0);
	height_edit->setValue(3.0);
	width_edit->setSuffix(tr(" km"));
	height_edit->setSuffix(tr(" km"));
	form->addRow(tr("Latitude (WGS84):"), latitude_edit);
	form->addRow(tr("Longitude (WGS84):"), longitude_edit);
	form->addRow(tr("Area width:"), width_edit);
	form->addRow(tr("Area height:"), height_edit);
	current_location_button->setMinimumHeight(44);
	form->addRow(QString(), current_location_button);
	for (auto* input : { latitude_edit, longitude_edit, width_edit, height_edit })
		input->setEnabled(false);
	current_location_button->setEnabled(false);
	import_base_map_check->setChecked(true);
	import_base_map_check->setMinimumHeight(44);
	form->addRow(import_base_map_check);

	auto* explanation = new QLabel(
	  tr("Set up the project and mapping area. On the next screen, choose the "
	     "map scale and symbol set. No desktop computer is required."), this);
	explanation->setWordWrap(true);

	buttons->button(QDialogButtonBox::Ok)->setText(tr("Next"));
	auto* layout = new QVBoxLayout(this);
	layout->addWidget(explanation);
	layout->addLayout(form);
	layout->addStretch(1);
	layout->addWidget(buttons);

	connect(name_edit, &QLineEdit::textChanged, this, &NewProjectDialog::updateState);
	connect(location_check, &QCheckBox::toggled, this, [this](bool enabled) {
		for (auto* input : { latitude_edit, longitude_edit, width_edit, height_edit })
			input->setEnabled(enabled);
		current_location_button->setEnabled(enabled);
	});
	connect(current_location_button, &QPushButton::clicked,
	        this, &NewProjectDialog::requestCurrentLocation);
	connect(buttons, &QDialogButtonBox::accepted, this, &QDialog::accept);
	connect(buttons, &QDialogButtonBox::rejected, this, &QDialog::reject);
	updateState();
}


QString NewProjectDialog::projectName() const
{
	return name_edit->text().trimmed();
}


bool NewProjectDialog::hasLocation() const
{
	return location_check->isChecked();
}


double NewProjectDialog::latitude() const
{
	return latitude_edit->value();
}


double NewProjectDialog::longitude() const
{
	return longitude_edit->value();
}


double NewProjectDialog::areaWidthKm() const
{
	return width_edit->value();
}


double NewProjectDialog::areaHeightKm() const
{
	return height_edit->value();
}


bool NewProjectDialog::importBaseMap() const
{
	return import_base_map_check->isChecked();
}


void NewProjectDialog::updateState()
{
	buttons->button(QDialogButtonBox::Ok)->setEnabled(!projectName().isEmpty());
}


void NewProjectDialog::requestCurrentLocation()
{
#if defined(Q_OS_ANDROID)
	if (AppPermissions::checkPermission(AppPermissions::LocationAccess) != AppPermissions::Granted)
	{
		AppPermissions::requestPermission(AppPermissions::LocationAccess,
		                                  this, &NewProjectDialog::requestCurrentLocation);
		return;
	}
#endif

#if defined(QT_POSITIONING_LIB)
	if (!position_source)
	{
		position_source = QGeoPositionInfoSource::createDefaultSource(this);
		if (position_source)
		{
			connect(position_source, &QGeoPositionInfoSource::positionUpdated,
			        this, [this](const QGeoPositionInfo& position) {
				const auto coordinate = position.coordinate();
				if (coordinate.isValid())
				{
					latitude_edit->setValue(coordinate.latitude());
					longitude_edit->setValue(coordinate.longitude());
					current_location_button->setText(tr("Location updated"));
				}
				current_location_button->setEnabled(true);
			});
			connect(position_source, &QGeoPositionInfoSource::errorOccurred,
			        this, [this](QGeoPositionInfoSource::Error) {
				current_location_button->setText(tr("Location unavailable — try again"));
				current_location_button->setEnabled(true);
			});
		}
	}
	if (position_source)
	{
		current_location_button->setText(tr("Finding location..."));
		current_location_button->setEnabled(false);
		position_source->requestUpdate(15000);
		return;
	}
#endif
	current_location_button->setText(tr("Location service unavailable"));
}

}  // namespace OpenOrienteering
