/*
 *    Copyright 2026 Chen Chen
 *
 *    This file is part of OpenOrienteering.
 */

#ifndef OPENORIENTEERING_NEW_PROJECT_DIALOG_H
#define OPENORIENTEERING_NEW_PROJECT_DIALOG_H

#include <QDialog>
#include <QString>

class QComboBox;
class QCheckBox;
class QDialogButtonBox;
class QDoubleSpinBox;
class QLineEdit;

namespace OpenOrienteering {

/** Touch-friendly first step for creating a self-contained mapping project. */
class NewProjectDialog : public QDialog
{
Q_OBJECT

public:
	explicit NewProjectDialog(QWidget* parent = nullptr);

	QString projectName() const;
	QString presetId() const;
	QString symbolSetId() const;
	QString symbolSetPath() const;
	unsigned int scale() const;
	bool hasLocation() const;
	double latitude() const;
	double longitude() const;
	double areaWidthKm() const;
	double areaHeightKm() const;

private slots:
	void updateState();

private:
	QLineEdit* name_edit;
	QComboBox* preset_combo;
	QCheckBox* location_check;
	QDoubleSpinBox* latitude_edit;
	QDoubleSpinBox* longitude_edit;
	QDoubleSpinBox* width_edit;
	QDoubleSpinBox* height_edit;
	QDialogButtonBox* buttons;
};

}  // namespace OpenOrienteering

#endif
