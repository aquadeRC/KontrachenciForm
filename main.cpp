#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "usernamefiltermodel.h"
#include "userdatamodel.h"
#include <QIcon>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/Ikony/LogoIntegra.svg"));

    UserDataModel userDataModel;

    UserNameFilterModel userFilterModel;
    userFilterModel.setRoleToFilter(UserDataModel::UserRoles::Nazwa);
    userFilterModel.setSourceModel(&userDataModel);

    UserNameFilterModel nipFilteredModel;
    nipFilteredModel.setRoleToFilter(UserDataModel::UserRoles::NIP);
    nipFilteredModel.setSourceModel(&userDataModel);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.setInitialProperties({
                                 {"usersListModel", QVariant::fromValue(&userDataModel)},
                                 {"userFilterModel", QVariant::fromValue(&userFilterModel)},
                                 {"nipFilterModel", QVariant::fromValue(&nipFilteredModel)}
                                });
    engine.loadFromModule("Dialog", "Main");

    return app.exec();
}
