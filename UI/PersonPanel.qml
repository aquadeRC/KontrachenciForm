pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Windows
import QtQuick.Layouts

Rectangle {
    id: root
    width: parent.width
    height: parent.height
    color: "#ccdff1"
    anchors.fill: parent

    required property AbstractItemModel userFilteredModel
    required property AbstractItemModel nipFilteredModel

    ColumnLayout {
        id: panelLayout
        anchors.fill: root
        anchors.topMargin: 10
        spacing: -5

        TabBar {
            id: bar
            width: panelLayout.width
            height: 30
            leftPadding: 12
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.fillWidth: true
            background: Rectangle {
                color: Qt.color("transparent")
                border.color: Qt.color("transparent")
            }

            TabButton {
                id: tabButton
                text: qsTr("Kontrachent")
                width: 120
                height: 30

                background: Rectangle {
                    id: backRect

                    implicitWidth: 100
                    implicitHeight: 30
                    color: "#f2f7fb"
                    border.color: "#f2f7fb"
                    border.width: 1
                    radius: 5
                }
                contentItem: Text {
                    text: tabButton.text
                    horizontalAlignment: Text.AlignHCenter
                    opacity: enabled ? 1.0 : 0.3
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
            }
        }

        StackLayout {
            id: stack
            width: panelLayout.width
            height: 243
            currentIndex: bar.currentIndex
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.fillWidth: true

            Rectangle {
                id: dataBackground
                width: 653
                height: 246
                color: "#f2f7fb"

                Rectangle {
                    id: dataRect
                    width: 639
                    height: 226
                    color: "#ffffff"
                    radius: 5
                    anchors.centerIn: dataBackground
                    z: 1

                    PersonDataPanel {
                        id: personData
                        anchors.centerIn: dataRect
                        usersModel: root.userFilteredModel
                        nipModel: root.nipFilteredModel
                    }
                }
            }
        }
    }
}
