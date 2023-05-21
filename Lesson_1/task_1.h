#pragma once
#include <QObject>
#include <QString>

class Task_1 : public QObject {
    Q_OBJECT

public:
    explicit Task_1(QObject *parent = nullptr);
    virtual ~Task_1() {}
    Q_INVOKABLE QString getAreaOnSides(QString A, QString B, QString C);
    Q_INVOKABLE QString getAreaByCoordinates(QString A, QString B, QString C);

signals:

};
