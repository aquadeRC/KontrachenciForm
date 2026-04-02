#include "userdatamodel.h"
#include<QList>


UserDataModel::UserDataModel(QObject *parent)
    : QAbstractListModel(parent)
{

    readData();
}


int UserDataModel::rowCount(const QModelIndex &parent) const
{
  //  if (parent.isValid())
   //     return 0;

    return m_userData.length();
}

QVariant UserDataModel::data(const QModelIndex &index, int role) const
{
    if (!checkIndex(index, CheckIndexOption::IndexIsValid))
        return QVariant();

    if (!index.isValid())
        return QVariant();

    int row = index.row();

    switch (role) {
    case Nazwa:
        return m_userData[row].m_nazwa;
    case Firma:
        return m_userData[row].m_firma;
    case Telefon:
        return m_userData[row].m_telefon1;
    case Telefon2:
        return m_userData[row].m_telefon2;
    case Email:
        return m_userData[row].m_email;
    case Kod:
        return m_userData[row].m_kod;
    case Miejscowosc:
        return m_userData[row].m_miejscowosc;
    case Adres:
        return m_userData[row].m_adres;
    case NIP:
        return m_userData[row].m_nip;
    }

    return QVariant();
}

bool UserDataModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (role != Qt::EditRole || value.toString().isEmpty())
        return false;
    const int row = index.row();

    QStringList newData = value.toString().split("#");

    m_userData[row].m_nazwa = newData[0];
    m_userData[row].m_firma = newData[1];
    m_userData[row].m_nip = newData[2];
    m_userData[row].m_telefon1 = newData[3];
    m_userData[row].m_telefon2 = newData[4];
    m_userData[row].m_email = newData[5];
    m_userData[row].m_kod = newData[6];
    m_userData[row].m_miejscowosc = newData[7];
    m_userData[row].m_adres = newData[8];

    emit dataChanged(index, index);
    return true;
}

Qt::ItemFlags UserDataModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return QAbstractItemModel::flags(index) | Qt::ItemIsEditable; // FIXME: Implement me!
}

bool UserDataModel::appendRow(int rowNumber)
{
    beginInsertRows(QModelIndex(), rowNumber, rowNumber);

    UserData newData;
    m_userData.append(newData);

    endInsertRows();
    return true;
}

 QHash<int, QByteArray> UserDataModel::roleNames() const
{
     QHash<int, QByteArray> mapping {
         {UserRoles::Nazwa, "nazwa"},
         {UserRoles::Firma, "firma"},
         {UserRoles::NIP, "nip"},
         {UserRoles::Telefon, "telefon1"},
         {UserRoles::Telefon2, "telefon2"},
         {UserRoles::Email, "email"},
         {UserRoles::Kod, "kod"},
         {UserRoles::Miejscowosc, "miejscowosc"},
         {UserRoles::Adres, "adres"}
     };
    return mapping;
}


void UserDataModel::readData()
{
    if(m_jwraper.loadData())
    {
        QList<UserData> data =m_jwraper.getData();
        QListIterator<UserData> dataIt(data);

        while(dataIt.hasNext())
        {
             m_userData.append(dataIt.next());
        }
    }

}
