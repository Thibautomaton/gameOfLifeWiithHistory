/****************************************************************************
** Meta object code from reading C++ file 'gameoflifemodel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../gameoflifemodel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gameoflifemodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GameOfLifeModel_t {
    QByteArrayData data[13];
    char stringdata0[121];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GameOfLifeModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GameOfLifeModel_t qt_meta_stringdata_GameOfLifeModel = {
    {
QT_MOC_LITERAL(0, 0, 15), // "GameOfLifeModel"
QT_MOC_LITERAL(1, 16, 11), // "QML.Element"
QT_MOC_LITERAL(2, 28, 4), // "auto"
QT_MOC_LITERAL(3, 33, 8), // "nextStep"
QT_MOC_LITERAL(4, 42, 16), // "GameOfLifeModel*"
QT_MOC_LITERAL(5, 59, 0), // ""
QT_MOC_LITERAL(6, 60, 8), // "loadFile"
QT_MOC_LITERAL(7, 69, 8), // "fileName"
QT_MOC_LITERAL(8, 78, 11), // "loadPattern"
QT_MOC_LITERAL(9, 90, 9), // "plainText"
QT_MOC_LITERAL(10, 100, 5), // "clear"
QT_MOC_LITERAL(11, 106, 5), // "Roles"
QT_MOC_LITERAL(12, 112, 8) // "CellRole"

    },
    "GameOfLifeModel\0QML.Element\0auto\0"
    "nextStep\0GameOfLifeModel*\0\0loadFile\0"
    "fileName\0loadPattern\0plainText\0clear\0"
    "Roles\0CellRole"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GameOfLifeModel[] = {

 // content:
       8,       // revision
       0,       // classname
       1,   14, // classinfo
       4,   16, // methods
       0,    0, // properties
       1,   44, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // classinfo: key, value
       1,    2,

 // methods: name, argc, parameters, tag, flags
       3,    0,   36,    5, 0x02 /* Public */,
       6,    1,   37,    5, 0x02 /* Public */,
       8,    1,   40,    5, 0x02 /* Public */,
      10,    0,   43,    5, 0x02 /* Public */,

 // methods: parameters
    0x80000000 | 4,
    QMetaType::Bool, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Void,

 // enums: name, alias, flags, count, data
      11,   11, 0x0,    1,   49,

 // enum data: key, value
      12, uint(GameOfLifeModel::CellRole),

       0        // eod
};

void GameOfLifeModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GameOfLifeModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { GameOfLifeModel* _r = _t->nextStep();
            if (_a[0]) *reinterpret_cast< GameOfLifeModel**>(_a[0]) = std::move(_r); }  break;
        case 1: { bool _r = _t->loadFile((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 2: _t->loadPattern((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->clear(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject GameOfLifeModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QAbstractTableModel::staticMetaObject>(),
    qt_meta_stringdata_GameOfLifeModel.data,
    qt_meta_data_GameOfLifeModel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GameOfLifeModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GameOfLifeModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GameOfLifeModel.stringdata0))
        return static_cast<void*>(this);
    return QAbstractTableModel::qt_metacast(_clname);
}

int GameOfLifeModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractTableModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
