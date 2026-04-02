#ifndef JSONWRAPPER_H
#define JSONWRAPPER_H

#include <QObject>
#include <QString>
#include <QJsonObject>
#include <QList>
#include "UserData.h"

class JsonWrapper : public QObject
{
    Q_OBJECT
public:
    explicit JsonWrapper(QObject *parent = nullptr);
    bool loadData();
    QList<UserData> getData();

private :
    void read(const QJsonObject &json);

    UserData readUserData(const QJsonObject &json);

    QString m_dataFile{"://data/Userdata.json"};
    QList<UserData> m_data;
};

#endif // JSONWRAPPER_H
