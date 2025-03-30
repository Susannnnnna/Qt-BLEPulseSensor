#ifndef CHARTDATA_H
#define CHARTDATA_H

#include <QObject>
#include <QPointF>
#include <QList>

class ChartData : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QPointF> chartData READ getChartData NOTIFY chartDataChanged)
public:
    explicit ChartData(QObject *parent = nullptr);

    QList<QPointF> getChartData() const;

signals:
    void chartDataChanged();

private:
    QList<QPointF> m_chartData;

};

#endif // CHARTDATA_H
