pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Windows
import QtQuick.Layouts

Rectangle {
    id: userCombo

    required property string nazwa
    required property string adres
    required property string miejscowosc
    required property string telefon1
    required property string telefon2
    required property string email
    required property string kod
    required property string nip
    required property int index

    property ItemView listView: ListView.view

    width: 445
    height: 67
    Layout.preferredWidth: 445
    Layout.preferredHeight: 67
    radius: 5
    border.color: ListView.isCurrentItem ? "95dce2" : "#dcdfe3"
    color: ListView.isCurrentItem ? "95dce2" : "#dcdfe3"

    ColumnLayout {
        spacing: 0
        Rectangle {
            id: upperRect
            color: "#ffffff"
            border.color: "#ffffff"
            topLeftRadius: 5
            topRightRadius: 5
            Layout.preferredWidth: 445
            Layout.preferredHeight: 32

            RowLayout {
                spacing: 6
                anchors {
                    fill: upperRect
                    leftMargin: 12
                    rightMargin: 12
                }

                RowLayout {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    spacing: 8
                    Rectangle {
                        width: 18
                        height: 18
                        color: Qt.color("transparent")
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Image {
                            anchors.fill: parent
                            source: "Ikony/single-user.svg"
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                    Text {
                        color: "#323438"
                        text: userCombo.nazwa
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                    }
                }
            }
        }
        Rectangle {
            id: lowerRect
            color: "#f5f6f7"
            border.color: "#f5f6f7"
            bottomLeftRadius: 5
            bottomRightRadius: 5
            Layout.preferredWidth: 445
            Layout.preferredHeight: 32
            RowLayout {
                spacing: 6
                anchors {
                    fill: lowerRect
                    leftMargin: 12
                    rightMargin: 12
                }

                RowLayout {
                    Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                    Image {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        source: "Ikony/Home.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                    Text {
                        color: "#323438"
                        text: userCombo.adres + ', ' + miejscowosc
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                RowLayout {
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    Image {
                        Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        source: "Ikony/Phones.svg"
                        fillMode: Image.PreserveAspectFit
                    }
                    Text {
                        color: "#323438"
                        text: userCombo.telefon1
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }

    MouseArea {
        id: userComboMArea
        anchors.fill: parent
        hoverEnabled: true

        onReleased: {
            userCombo.listView.currentIndex = userCombo.index
            userCombo.color = "white"
        }
        onDoubleClicked: {
            let userdata = userCombo.nazwa + "#" + userCombo.nip + "#" + userCombo.telefon1
            + "#" + userCombo.telefon2 + "#" + userCombo.email + "#" + userCombo.kod
            + "#" + userCombo.miejscowosc + "#" + userCombo.adres

            userCombo.listView.userItemSelected(userdata)
            customPopup.close()
        }
    }
}
