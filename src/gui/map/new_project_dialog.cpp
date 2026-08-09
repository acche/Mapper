/*
 *    Copyright 2026 Chen Chen
 *
 *    This file is part of OpenOrienteering.
 */

#include "new_project_dialog.h"

#include <QComboBox>
#include <QCheckBox>
#include <QDate>
#include <QDialogButtonBox>
#include <QDir>
#include <QDoubleSpinBox>
#include <QFileInfo>
#include <QFormLayout>
#include <QLabel>
#include <QLineEdit>
#include <QPushButton>
#include <QVBoxLayout>

namespace OpenOrienteering {

namespace {

enum PresetRole
{
	PresetIdRole = Qt::UserRole,
	ScaleRole,
	SymbolSetRole
};

}  // namespace


NewProjectDialog::NewProjectDialog(QWidget* parent)
: QDialog(parent, Qt::WindowSystemMenuHint | Qt::WindowTitleHint)
, name_edit(new QLineEdit(this))
, preset_combo(new QComboBox(this))
, location_check(new QCheckBox(tr("Set the mapping area now"), this))
, latitude_edit(new QDoubleSpinBox(this))
, longitude_edit(new QDoubleSpinBox(this))
, width_edit(new QDoubleSpinBox(this))
, height_edit(new QDoubleSpinBox(this))
, buttons(new QDialogButtonBox(QDialogButtonBox::Cancel | QDialogButtonBox::Ok, this))
{
	setWindowTitle(tr("Create mapping project"));
	setMinimumWidth(420);

	name_edit->setText(tr("Map %1").arg(QDate::currentDate().toString(Qt::ISODate)));
	name_edit->selectAll();

	auto add_preset = [this](const QString& title, const QString& id,
	                         unsigned int denominator, const QString& symbol_set) {
		preset_combo->addItem(title);
		const auto index = preset_combo->count() - 1;
		preset_combo->setItemData(index, id, PresetIdRole);
		preset_combo->setItemData(index, denominator, ScaleRole);
		preset_combo->setItemData(index, symbol_set, SymbolSetRole);
	};
	add_preset(tr("Sprint or school map — 1:4,000"),
	           QStringLiteral("sprint"), 4000, QStringLiteral("ISSprOM 2019_4000.omap"));
	add_preset(tr("Forest map — 1:10,000"),
	           QStringLiteral("forest"), 10000, QStringLiteral("ISOM 2017-2_10000.omap"));
	add_preset(tr("Mountain bike map — 1:10,000"),
	           QStringLiteral("mtb"), 10000, QStringLiteral("ISMTBOM_10000.omap"));
	add_preset(tr("Ski map — 1:10,000"),
	           QStringLiteral("ski"), 10000, QStringLiteral("ISSkiOM 2019_10000.omap"));
	add_preset(tr("Course planning — 1:10,000"),
	           QStringLiteral("course"), 10000, QStringLiteral("Course_Design_10000.omap"));

	auto* form = new QFormLayout();
	form->addRow(tr("Project name:"), name_edit);
	form->addRow(tr("Map type:"), preset_combo);
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
	for (auto* input : { latitude_edit, longitude_edit, width_edit, height_edit })
		input->setEnabled(false);

	auto* explanation = new QLabel(
	  tr("Mapper will create a project folder, load the matching symbol set, "
	     "and save the first map automatically. No desktop computer is required."), this);
	explanation->setWordWrap(true);

	buttons->button(QDialogButtonBox::Ok)->setText(tr("Create project"));
	auto* layout = new QVBoxLayout(this);
	layout->addWidget(explanation);
	layout->addLayout(form);
	layout->addStretch(1);
	layout->addWidget(buttons);

	connect(name_edit, &QLineEdit::textChanged, this, &NewProjectDialog::updateState);
	connect(location_check, &QCheckBox::toggled, this, [this](bool enabled) {
		for (auto* input : { latitude_edit, longitude_edit, width_edit, height_edit })
			input->setEnabled(enabled);
	});
	connect(buttons, &QDialogButtonBox::accepted, this, &QDialog::accept);
	connect(buttons, &QDialogButtonBox::rejected, this, &QDialog::reject);
	updateState();
}


QString NewProjectDialog::projectName() const
{
	return name_edit->text().trimmed();
}


QString NewProjectDialog::presetId() const
{
	return preset_combo->currentData(PresetIdRole).toString();
}


QString NewProjectDialog::symbolSetId() const
{
	return preset_combo->currentData(SymbolSetRole).toString();
}


QString NewProjectDialog::symbolSetPath() const
{
	const auto relative_path = QStringLiteral("symbol sets/%1/%2")
	                           .arg(scale()).arg(symbolSetId());
	for (const auto& data_path : QDir::searchPaths(QStringLiteral("data")))
	{
		auto path = QDir(data_path).filePath(relative_path);
		if (QFileInfo::exists(path))
			return path;

		// Development builds deliberately rename writable symbol-set copies.
		const auto file_info = QFileInfo(path);
		path = file_info.dir().filePath(QStringLiteral("COPY_OF_") + file_info.fileName());
		if (QFileInfo::exists(path))
			return path;
	}
	return {};
}


unsigned int NewProjectDialog::scale() const
{
	return preset_combo->currentData(ScaleRole).toUInt();
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


void NewProjectDialog::updateState()
{
	buttons->button(QDialogButtonBox::Ok)->setEnabled(!projectName().isEmpty());
}

}  // namespace OpenOrienteering
