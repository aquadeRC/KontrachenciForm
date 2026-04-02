#ifndef USERNAMEFILTERMODEL_H
#define USERNAMEFILTERMODEL_H

#include <QObject>
#include <QQmlEngine>
#include <QSortFilterProxyModel>


class UserNameFilterModel : public QSortFilterProxyModel
{
    Q_OBJECT
    QML_ELEMENT
    QML_UNCREATABLE("UserNameFilterModel must be instantiated in C++")
    Q_PROPERTY(QString templatePattern READ templatePattern WRITE setTemplatePattern NOTIFY templatePatternChanged FINAL)
public:
    explicit UserNameFilterModel(QObject *parent = nullptr);

    QString templatePattern() const;
    void setTemplatePattern(const QString &newLastName);

    void setRoleToFilter(int role);

signals:
    void templatePatternChanged();

protected:
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const override;

private:
    QString m_template;
    int m_role2Filter;
};

#endif // USERNAMEFILTERMODEL_H
