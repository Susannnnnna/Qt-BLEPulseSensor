#include "CsvDataLoader.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <qpoint.h>
#include <qvariant.h>

CsvDataLoader::CsvDataLoader(QObject *parent)
    : QObject{parent}
{}

bool CsvDataLoader::loadData(const QString &filePath)
{
    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "File cannot be open: " << filePath;
        return false;
    }

    m_data.clear();
    QTextStream in(&file);
    while (!in.atEnd()) {
        QString line = in.readLine();
        auto parts = line.split(',');
        if (parts.size() == 2) {
            bool ok1, ok2;
            double time = parts[0].toDouble(&ok1);
            double value = parts[1].toDouble(&ok2);
            if (ok1 && ok2) {
                m_data.append(QPointF(time, value));
            }
        }
    }

    file.close();
    emit dataLoaded();
    return true;
}

QVariantList CsvDataLoader::getChartData() const
{
    QVariantList chartData;
    for (const auto &point : m_data) {
        chartData.append(QVariant::fromValue(point));
    }
    return chartData;
}


















