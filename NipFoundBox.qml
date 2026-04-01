pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Windows
import QtQuick.Layouts

Rectangle {
    id: root
    property int filteredItems: 0
    property AbstractItemModel nipModel

    signal userItemSelected(string data)
    radius: 5
    border.color: "#669fd4"
    color: "#f2f7fb"
    anchors.fill: parent
    implicitHeight: viewRect.implicitHeight

    Rectangle {
        id: viewRect
        anchors {
            fill: root
            topMargin: 15
        }
        implicitHeight: comboView.implicitHeight
        color: Qt.color("transparent")

        ListView {
            id: comboView

            implicitHeight: 120
            anchors {
                fill: viewRect
                margins: 6
            }

            spacing: 6
            focus: true
            clip: true

            model: root.nipModel
            delegate: UserComboDelegate {}

            highlightFollowsCurrentItem: true
            highlight: userHighlight
            highlightMoveDuration: 1
            highlightResizeDuration: 1

            signal userItemSelected(string data)

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AlwaysOn
                active: ScrollBar.AlwaysOn
                size: 0.3
            }

            Component {
                id: userHighlight

                Rectangle {
                    id: highlightRect

                    border.color: "#95dce2"
                    color: "#95dce2"
                    opacity: 0.15
                    z: 3
                }
            }
        }
    }

    Connections {
        target: comboView
        ignoreUnknownSignals: true

        function onUserItemSelected(data) {
            root.userItemSelected(data)
        }
    }
}
