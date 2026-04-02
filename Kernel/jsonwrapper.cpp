#include "jsonwrapper.h"
#include <QFile>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QList>
#include <QDir>
#include <QDebug>
#include <QUrl>

JsonWrapper::JsonWrapper(QObject *parent)
    : QObject{parent}, m_dataFile{}
{

    loadData();
}

bool JsonWrapper::loadData()
{
    QFile file(QUrl("data/Userdata.json").toString());
    QDir dir;
    qDebug()<<dir.absolutePath();



    if (!file.open(QIODevice::ReadOnly)) {
        qWarning("Nie mogę otworzyć pliku userData.");
        return false;
    }

    QByteArray loadData = file.readAll();
    file.close();
    QJsonDocument loadDoc(QJsonDocument::fromJson(loadData));
    read(loadDoc.object());

    return true;
}

QList<UserData> JsonWrapper::getData()
{
    return m_data;
}


void JsonWrapper::read(const QJsonObject &json)
{
    if (const QJsonValue v = json["users"]; v.isArray()) {
        const QJsonArray users = v.toArray();
        m_data.clear();
        m_data.reserve(users.size());
        for (const QJsonValue &user : users)
            m_data.append(readUserData(user.toObject()));
    }
}

UserData JsonWrapper::readUserData(const QJsonObject &json)
{
    UserData result;
    if (const QJsonValue v = json["nazwa"]; v.isString())
        result.m_nazwa = v.toString();
    if (const QJsonValue v = json["firma"]; v.isString())
        result.m_firma = v.toString();
    if (const QJsonValue v = json["nip"]; v.isString())
        result.m_nip = v.toString();
    if (const QJsonValue v = json["telefon1"]; v.isString())
        result.m_telefon1 = v.toString();
    if (const QJsonValue v = json["telefon2"]; v.isString())
        result.m_telefon2 = v.toString();
    if (const QJsonValue v = json["email"]; v.isString())
        result.m_email = v.toString();
    if (const QJsonValue v = json["kod"]; v.isString())
        result.m_kod = v.toString();
    if (const QJsonValue v = json["miejscowosc"]; v.isString())
        result.m_miejscowosc = v.toString();
    if (const QJsonValue v = json["adres"]; v.isString())
        result.m_adres = v.toString();

    return result;
}
