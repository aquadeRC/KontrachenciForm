pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Windows
import QtQuick.Layouts

ApplicationWindow {
    id: root
    minimumWidth: 654
    minimumHeight: 352
    maximumHeight: 352
    maximumWidth: 654
    opacity: 1
    visible: true
    color: "#ccdff1"

    required property UserDataModel usersListModel
    required property UserNameFilterModel userFilterModel
    required property UserNameFilterModel nipFilterModel

    title: qsTr("Zlecenie - Edycja")

    footer: Footer {}

    PersonPanel {
        anchors.fill: parent
        userFilteredModel: userFilterModel
        nipFilteredModel: nipFilterModel
    }
}
