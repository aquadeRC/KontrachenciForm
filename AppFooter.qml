import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Rectangle {
    id: bottom_button_group
    x: 0
    width: parent.width
    height: 46
    visible: true
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0

    RowLayout {
        anchors.fill: parent
        anchors.rightMargin: 8
        layoutDirection: Qt.LeftToRight
        spacing: 4

        Rectangle {
            border.color: "#ffffff"
            Layout.fillWidth: true
        }

        Rectangle {
            id: cancelButton
            Layout.preferredWidth: 112
            Layout.preferredHeight: 30
            color: "#ffffff"
            border.color: "#003d76"
            border.width: 1
            radius: 5

            property string text: qsTr("Anuluj")
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            Text {
                text: cancelButton.text
                opacity: enabled ? 1.0 : 0.3
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                color: "#003d76"
            }

            MouseArea {
                id: cancelButtonMouseArea
                anchors.fill: parent

                Connections {
                    target: cancelButtonMouseArea
                    function onClicked() {
                        page.state = "State1"
                    }
                }
            }
        }

        Rectangle {
            id: okButton
            Layout.preferredWidth: 112
            Layout.preferredHeight: 30
            color: "#003d76"
            border.color: "#003d76"
            border.width: 1
            radius: 5

            property string text: qsTr("Zapisz")
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            Text {
                text: okButton.text
                opacity: enabled ? 1.0 : 0.3
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                color: "#ffffff"
            }

            MouseArea {
                id: okButtonMouseArea
                anchors.fill: parent

                Connections {
                    target: okButtonMouseArea
                    function onClicked() {
                        page.state = "State1"
                    }
                }
            }
        }
    }
}
