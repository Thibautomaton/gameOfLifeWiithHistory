/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#include <gameoflifemodel.h>

void qml_register_types_GameOfLifeModel()
{
    qmlRegisterTypesAndRevisions<GameOfLifeModel>("GameOfLifeModel", 1);
    qmlRegisterModule("GameOfLifeModel", 1, 0);
}

static const QQmlModuleRegistration registration("GameOfLifeModel", 1, qml_register_types_GameOfLifeModel);
