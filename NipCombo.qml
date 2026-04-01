pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Windows
import QtQuick.Layouts

Rectangle {
    id: root

    required property AbstractItemModel nipModel
    required property string labelValue
    property string fieldValue
    property string fieldImage
    property int filteredItems: 0

    Layout.preferredWidth: 120
    Layout.preferredHeight: 34
    radius: 5
    border.color: "#d7dadf"

    signal userItemSelected(string data)

    Rectangle {
        id: placeholdetText
        z: 5
        anchors {
            left: root.left
            baseline: root.top
            leftMargin: 5
            topMargin: 10
        }
        color: "#ffffff"
        border.color: "#ffffff"

        Text {
            anchors.fill: placeholdetText

            color: "#646870"
            text: root.labelValue
            font.pixelSize: 9
            verticalAlignment: Text.AlignVCenter
        }
    }

    TextInput {
        id: nipText
        width: parent.width

        color: "#646870"
        text: root.fieldValue
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter
        leftPadding: 8
    }

    Rectangle {
        id: nipRectangle
        x: 441
        y: 1
        width: 16
        height: 16
        color: "#ffffff"
        anchors {
            verticalCenter: root.verticalCenter
            right: root.right
            rightMargin: 10
        }

        Image {
            id: image
            anchors.fill: nipRectangle
            source: root.fieldImage
            fillMode: Image.PreserveAspectFit
        }
    }

    Connections {
        target: nipText
        ignoreUnknownSignals: true
        function onTextEdited() {
            let val = nipText.length
            if (val >= 3) {
                root.nipModel.templatePattern = nipText.text
                customPopup.open()

                root.filteredItems = root.nipModel.rowCount()

                if (root.filteredItems > 0) {
                    itemLoader.source = "NipFoundBox.qml"
                } else {
                    itemLoader.source = "NIpNotFoundBox.qml"
                }
            }
        }
    }

    Popup {
        id: customPopup
        y: nipText.x + nipText.height + 2
        x: {
            (nipText.x + nipText.width) - 481
        }
        width: 481
        implicitHeight: contentItem.implicitHeight
        padding: 1
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        contentItem: Loader {
            id: itemLoader
            focus: true
            anchors.fill: parent

            Binding {
                target: itemLoader.item
                property: "filteredItems"
                value: root.filteredItems
            }
            Binding {
                target: itemLoader.item
                property: "nipModel"
                value: root.nipModel
            }
        }
    }

    Connections {
        target: itemLoader.item
        ignoreUnknownSignals: true

        function onUserItemSelected(data) {
            customPopup.close()
            root.userItemSelected(data)
        }
    }
}
