pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

FocusScope {
    id: root
    width: 120
    height: 34

    required property string fieldValue
    required property string fieldImage
    required property string labelValue

    Rectangle {
        id: fieldREct
        anchors.fill: root
        radius: 5
        border.color: "#d7dadf"
    }

    Loader {
        id: iconPlaceholderLoader
        focus: true

        Binding {
            target: iconPlaceholderLoader.item
            property: "labelValue"
            value: root.labelValue
        }
    }

    TextInput {
        id: textInput
        width: root.width - iconRect.width - 10
        focus: true

        color: "#646870"
        text: root.fieldValue
        anchors {
            left: root.left
            top: root.top
            bottom: root.bottom
        }

        font.pixelSize: 12
        verticalAlignment: Text.AlignVCenter
        leftPadding: 8
    }
    Connections {
        target: textInput
        function onTextEdited() {
            iconPlaceholderLoader.source = "FloatingTitle.qml"
        }
    }

    Rectangle {
        id: iconRect
        width: 16
        height: 16
        color: "#ffffff"
        anchors {
            verticalCenter: root.verticalCenter
            right: root.right
            rightMargin: 10
        }

        Image {
            id: iconImage
            anchors.fill: iconRect
            source: root.fieldImage
            fillMode: Image.PreserveAspectFit
        }
    }
}
