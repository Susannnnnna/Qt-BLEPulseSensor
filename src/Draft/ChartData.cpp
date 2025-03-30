#include "ChartData.h"
#include <qpoint.h>

ChartData::ChartData(QObject *parent)
    : QObject(parent) {

    //Example data for test
    m_chartData.append(QPointF(0, 1));
    m_chartData.append(QPointF(1, 3));
    m_chartData.append(QPointF(2, 5));
    m_chartData.append(QPointF(3, 7));
    m_chartData.append(QPointF(4, 9));
}

QList<QPointF> ChartData::getChartData() const {
    return m_chartData;
}
