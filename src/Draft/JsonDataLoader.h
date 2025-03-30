#ifndef JSONDATALOADER_H
#define JSONDATALOADER_H

#include <QObject>
#include <Qvector>
#include <QPointF>
#include <QString>
#include <QVariantList>

class JsonDataLoader : public QObject
{
    Q_OBJECT
public:
    explicit JsonDataLoader(QObject *parent = nullptr);

    Q_INVOKABLE bool loadData(const QString &filePath);
    Q_INVOKABLE QVariantList getChartData() const;

signals:
    void dataLoaded();

private:
    QVector<QPointF> m_data;
};

#endif // JSONDATALOADER_H
