#ifndef CSVDATALOADER_H
#define CSVDATALOADER_H

#include <QObject>
#include <QString>
#include <QVector>
#include <QPair>

class CsvDataLoader : public QObject
{
    Q_OBJECT
public:
    explicit CsvDataLoader(QObject *parent = nullptr);

    Q_INVOKABLE bool loadData(const QString &filePath);
    Q_INVOKABLE QVariantList getChartData() const;

signals:
    void dataLoaded();

private:
    QVector<QPointF> m_data; // Store data in format (timestamp, value)
};

#endif // CSVDATALOADER_H
