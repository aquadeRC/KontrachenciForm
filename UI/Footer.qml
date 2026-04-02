import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

Rectangle {
    id: footerItem
    x: 0
    width: parent.width
    height: 46
    visible: true
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0

    property FooterButton zapiszButon: okButton
    property FooterButton anulujButon: cancelButton

    signal buttonClicked

    RowLayout {
        anchors.fill: footerItem
        anchors.rightMargin: 8
        layoutDirection: Qt.LeftToRight
        spacing: 4

        Rectangle {
            border.color: "#ffffff"
            Layout.fillWidth: true
        }

        FooterButton {
            id: cancelButton
            buttonName: qsTr("Anuluj")
            isDefault: false
        }
        FooterButton {
            id: okButton
            buttonName: qsTr("Zapisz")
            isDefault: true
        }
    }

    component FooterButton: Button {
        id: footerButton
        required property string buttonName
        required property bool isDefault

        Layout.preferredWidth: 112
        Layout.preferredHeight: 30

        background: Rectangle {
            id: backRect

            implicitWidth: 100
            implicitHeight: 40
            color: footerButton.isDefault ? "#003d76" : "#ffffff"
            border.color: footerButton.isDefault ? "#ffffff" : "#003d76"
            border.width: 1
            radius: 5
        }
        contentItem: Text {
            text: footerButton.buttonName
            opacity: enabled ? 1.0 : 0.3
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            color: footerButton.isDefault ? "#ffffff" : "#003d76"
        }
    }

    MouseArea {
        id: futterButtonArea
        anchors.fill: footerItem
        hoverEnabled: true

        onClicked: {
            footerItem.buttonClicked()
        }
    }
}
