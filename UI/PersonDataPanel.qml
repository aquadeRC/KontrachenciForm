pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    x: 8
    y: 13
    width: 637
    height: 226
    color: "#ffffff"
    border.color: "#ffffff"
    border.width: 2
    anchors.centerIn: parent

    required property AbstractItemModel usersModel
    required property AbstractItemModel nipModel

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 10

        RowLayout {
            Layout.fillWidth: true
            Image {
                id: user_image
                Layout.preferredWidth: 23
                Layout.preferredHeight: 23
                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                Layout.leftMargin: 1
                source: "Ikony/single-user.svg"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: text2
                text: qsTr("Zleceniodawca")
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                font.pixelSize: 15
                Layout.fillWidth: true
            }
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            UserCombo {
                id: comboUser
                controllModel: root.usersModel
                fieldValue: qsTr("Nazwa")
                labelValue: qsTr("Nazwa")
                fieldImage: "Ikony/SearchLoupe.svg"
            }
            NipCombo {
                id: comboNip
                nipModel: root.nipModel
                fieldValue: qsTr("NIP")
                labelValue: qsTr("NIP")
                fieldImage: "Ikony/GlobeSearchNIP.svg"
            }
        }
        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            IconTextField {
                id: userPhone1
                Layout.preferredWidth: 120
                Layout.preferredHeight: 34

                fieldValue: qsTr("Telefon 1")
                labelValue: qsTr("Telefon 1")
                fieldImage: "Ikony/Phones.svg"
            }
            IconTextField {
                id: userPhone2
                Layout.preferredWidth: 120
                Layout.preferredHeight: 34

                fieldValue: qsTr("Telefon 2")
                labelValue: qsTr("Telefon 2")
                fieldImage: "Ikony/Phones.svg"
            }
            IconTextField {
                id: userEmail
                Layout.preferredWidth: 353
                Layout.preferredHeight: 34

                fieldValue: qsTr("Email")
                labelValue: qsTr("Email")
                fieldImage: "Ikony/email.svg"
            }
        }
        RowLayout {
            Layout.fillWidth: true
            spacing: 10

            IconTextField {
                id: userKod
                Layout.preferredWidth: 120
                Layout.preferredHeight: 34

                fieldValue: qsTr("Kod")
                labelValue: qsTr("Kod")
                fieldImage: "Ikony/GlobeSearchNIP.svg"
            }

            CustomTextField {
                id: userCity
                Layout.preferredWidth: 200
                Layout.preferredHeight: 34

                fieldValue: qsTr("Miejscowość")
                labelValue: qsTr("Miejscowość")
            }

            CustomTextField {
                id: userAdress
                Layout.preferredWidth: 274
                Layout.preferredHeight: 34

                fieldValue: qsTr("Adres")
                labelValue: qsTr("Adres")
            }
        }
        RowLayout {
            Layout.preferredHeight: 24
            Layout.preferredWidth: 614
            Layout.fillHeight: false
            Layout.fillWidth: true
            spacing: 4

            IconButton {
                id: userZgody
                Layout.preferredWidth: 125

                fieldValue: qsTr("Zgody/RODO")
                fieldImage: "Ikony/checklist.svg"
            }

            Rectangle {
                border.color: "#ffffff"
                Layout.fillWidth: true
                Layout.preferredHeight: 24
            }

            IconButton {
                id: userDodaj
                Layout.preferredWidth: 77
                fieldValue: qsTr("Dodaj")
                fieldImage: "Ikony/plusadd.svg"
            }

            IconButton {
                id: zmienDane
                Layout.preferredWidth: 114
                fieldValue: qsTr("Zmien dane")
                fieldImage: "Ikony/PenEdit2.svg"
            }

            SimpleIconButton {
                id: more
                Layout.preferredWidth: 24
                fieldImage: "Ikony/More.svg"
            }
        }
    }

    Connections {
        target: comboUser
        ignoreUnknownSignals: true
        function onUserItemSelected(data) {
            const userData = data.split("#");

            comboUser.fieldValue = userData[0];
            comboNip.fieldValue = userData[1];
            userPhone1.fieldValue = userData[2];
            userPhone2.fieldValue = userData[3];
            userEmail.fieldValue = userData[4];
            userKod.fieldValue = userData[5];
            userCity.fieldValue = userData[6];
            userAdress.fieldValue = userData[7];
        }
    }

    Connections {
        target: comboNip
        ignoreUnknownSignals: true
        function onUserItemSelected(data) {
            const userData = data.split("#");

            comboUser.fieldValue = userData[0];
            comboNip.fieldValue = userData[1];
            userPhone1.fieldValue = userData[2];
            userPhone2.fieldValue = userData[3];
            userEmail.fieldValue = userData[4];
            userKod.fieldValue = userData[5];
            userCity.fieldValue = userData[6];
            userAdress.fieldValue = userData[7];
        }
    }

    component CustomTextField: Rectangle {
        id: textFieldRoot

        required property string fieldValue
        required property string labelValue

        Layout.preferredWidth: 120
        Layout.preferredHeight: 34
        radius: 5
        border.color: "#d7dadf"

        Loader {
            id: textPlaceholderLoader
            focus: true

            Binding {
                target: textPlaceholderLoader.item
                property: "labelValue"
                value: textFieldRoot.labelValue
            }
        }

        TextInput {
            id: textFielInput
            width: parent.width

            color: "#646870"
            text: textFieldRoot.fieldValue
            anchors {
                left: textFieldRoot.left
                top: textFieldRoot.top
                bottom: textFieldRoot.bottom
            }
            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
            leftPadding: 8
        }

        Connections {
            target: textFielInput
            function onTextEdited() {
                textPlaceholderLoader.source = "FloatingTitle.qml";
            }
        }
    }

    component IconButton: Rectangle {
        id: iconButton

        required property string fieldValue
        required property string fieldImage
        Layout.preferredWidth: 125
        Layout.preferredHeight: 24
        radius: 5
        border.color: "#9fc3e5"
        Layout.fillWidth: false

        RowLayout {
            anchors {
                fill: parent
                leftMargin: 8
                rightMargin: 8
            }

            layoutDirection: Qt.LeftToRight
            spacing: 6

            Rectangle {
                width: 16
                height: 16
                color: "#ffffff"
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                Image {
                    anchors.fill: parent
                    source: iconButton.fieldImage
                    fillMode: Image.PreserveAspectFit
                }
            }

            Text {
                id: butonText
                color: "#003d76"
                text: iconButton.fieldValue
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                font.pixelSize: 12
                verticalAlignment: Text.AlignVCenter
            }
        }
    }

    component SimpleIconButton: Rectangle {
        id: simpleiconButton

        required property string fieldImage

        Layout.preferredWidth: 125
        Layout.preferredHeight: 24
        radius: 5
        border.color: "#9fc3e5"
        Layout.fillWidth: false

        RowLayout {
            anchors.fill: parent
            layoutDirection: Qt.LeftToRight
            spacing: 6

            Rectangle {
                width: 16
                height: 16
                color: "#ffffff"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Image {
                    anchors.fill: parent
                    source: simpleiconButton.fieldImage
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}
