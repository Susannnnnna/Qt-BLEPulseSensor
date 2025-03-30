#include "JsonDataLoader.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QDebug>

JsonDataLoader::JsonDataLoader(QObject *parent)
    : QObject{parent}
{}

bool JsonDataLoader::loadData(const QString &filePath) {
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file: " << filePath;
        return false;
    }

    QByteArray jsonData = file.readAll();
    file.close();

    QJsonDocument document = QJsonDocument::fromJson(jsonData);
    if (!document.isArray()) {
        qWarning() << "Invalid JSON format:  excepted an array";
        return false;
    }

    m_data.clear();
    QJsonArray jsonArray = document.array();
    for (const QJsonValue &value : jsonArray) {
        QJsonObject obj = value.toObject();
        double time = obj["time"].toDouble();
        double pulse = obj["pulse"].toDouble();
        m_data.append(QPointF(time, pulse));
    }

    emit dataLoaded();
    return false;
}

QVariantList JsonDataLoader::getChartData() const
{
    QVariantList chartData;
    for (const QPointF &point : m_data) {
        chartData.append(QVariant::fromValue(point));
    }
    return chartData;
}
