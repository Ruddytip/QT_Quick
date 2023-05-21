#include "task_1.h"
#include <cmath>

Task_1::Task_1(QObject *parent) : QObject{parent} {

}

QString Task_1::getAreaOnSides(QString A, QString B, QString C){
    QString out = "Площадь треугольника: ";
    //S = p(p - a)(p - b)(p - c), где p — полупериметр треугольника; a, b и c — длины сторон
    double a = A.toDouble();
    double b = B.toDouble();
    double c = C.toDouble();
    double p = (a + b + c) * 0.5;
    double s = std::sqrt(p * (p - a) * (p - b) * (p - c));
    QString S = QString::number(s);
    out += S;
    return S;
}

void pointToDouble(const QString point, double& x, double& y){
    int index = 0;
    for(auto it : point){
        if(it == ',') break;
        ++index;
    }
    x = point.mid(0, index).toDouble();
    y = point.mid(index + 1, point.length() - index).toDouble();
}

QString coordsToSide(const QString p1, const QString p2){
    double x1, y1, x2, y2;
    pointToDouble(p1, x1, y1);
    pointToDouble(p2, x2, y2);

    //d = √ (x2-x1)²+ (y2-y1)²
    double out = std::sqrt(std::pow(x2 - x1, 2) + std::pow(y2 - y1, 2));
    return QString::number(out);
}

QString Task_1::getAreaByCoordinates(QString A, QString B, QString C) {
    return getAreaOnSides(coordsToSide(A, B), coordsToSide(B, C), coordsToSide(C, A));
}
