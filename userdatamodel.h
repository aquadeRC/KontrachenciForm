#ifndef USERDATAMODEL_H
#define USERDATAMODEL_H

#include <QAbstractListModel>
#include <QModelIndex>
#include <QVariant>
#include <QtQml>

#include "UserData.h"
#include "jsonwrapper.h"

class UserDataModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("UserDataModel must be instantiated in C++")
public:
    enum UserRoles {
        Nazwa = Qt::UserRole + 1,
        Firma,
        Telefon,
        Telefon2,
        Email,
        Kod,
        Miejscowosc,
        Adres,
        NIP
    };
    explicit UserDataModel(QObject *parent = nullptr);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex &index) const override;
    QHash<int, QByteArray> roleNames() const override;

    // Add data:
    Q_INVOKABLE bool appendRow(int rowNumber);

private:
    void readData();
    QList<UserData> m_userData;
    JsonWrapper m_jwraper;
};

#endif // USERDATAMODEL_H
