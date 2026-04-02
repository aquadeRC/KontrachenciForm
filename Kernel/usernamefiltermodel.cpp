#include "usernamefiltermodel.h"


UserNameFilterModel::UserNameFilterModel(QObject *parent)
    : QSortFilterProxyModel{parent}
{}

QString UserNameFilterModel::templatePattern() const
{
    return m_template;
}

void UserNameFilterModel::setTemplatePattern(const QString &newName)
{
    if (m_template == newName)
      return;

    beginFilterChange();
    QRegularExpression::PatternOptions options = QRegularExpression::NoPatternOption;
    QString pattern = QRegularExpression::escape(newName);

    QRegularExpression regularExpression(pattern, options);
    setFilterRegularExpression(regularExpression);

    m_template = newName;
    endFilterChange();
}

void UserNameFilterModel::setRoleToFilter(int role)
{
    if (m_role2Filter == role)
        return;
    m_role2Filter = role;
}


bool UserNameFilterModel::filterAcceptsRow(int source_row, const QModelIndex &source_parent) const
{
    const QModelIndex index = sourceModel()->index(source_row, 0, source_parent);
    const QString data = index.data(m_role2Filter).toString();

    bool templateEmpty = m_template.isEmpty();
    if(templateEmpty)
        return false;

    if(m_template.length()<3)
        return false;

    return data.contains(filterRegularExpression());
}
