pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Windows
import QtQuick.Layouts

Rectangle {
    id: root

    required property AbstractItemModel controllModel
    required property string labelValue
    property string fieldValue
    property string fieldImage
    property int filteredItems: 0

    Layout.preferredWidth: 481
    Layout.preferredHeight: 34
    radius: 5
    border.color: "#d7dadf"

    signal userItemSelected(string data)

    Rectangle {
        id: placeholderText
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
            anchors.fill: placeholderText

            color: "#646870"
            text: root.labelValue
            font.pixelSize: 9
            verticalAlignment: Text.AlignVCenter
        }
    }

    TextInput {
        id: coText
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
        id: rectangle3
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
            anchors.fill: rectangle3
            source: root.fieldImage
            fillMode: Image.PreserveAspectFit
        }
    }

    Connections {
        target: coText
        ignoreUnknownSignals: true
        function onTextEdited() {
            let val = coText.length
            if (val >= 3) {
                root.controllModel.templatePattern = coText.text
                customPopup.open()

                root.filteredItems = root.controllModel.rowCount()
            }
        }
    }

    Popup {
        id: customPopup
        y: coText.x + coText.height + 2
        width: 481
        height: 100
        implicitHeight: contentItem.implicitHeight
        padding: 1
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        contentItem: Rectangle {
            radius: 5
            border.color: "#669fd4"
            color: "#f2f7fb"
            anchors.fill: parent
            implicitHeight: 200 //popupText.implicitHeight + comboView.implicitHeight

            ColumnLayout {
                spacing: 9
                anchors.fill: parent
                anchors.margins: 6

                RowLayout {
                    spacing: 3
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    Text {
                        id: popupText
                        color: "#003d76"
                        text: "Znaleziono:"
                        // anchors.top: parent.top
                        // anchors.left: parent.left
                        //Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        font.pixelSize: 12
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: popupText2

                        //  anchors.left: popupText.right
                        //  anchors.top: parent.top
                        color: "#003d76"
                        text: {
                            "%1 wyników".arg(root.filteredItems)
                        }
                        // Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        font.pixelSize: 12
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Rectangle {
                    anchors.fill: parent
                    anchors.topMargin: 15
                    // anchors.top: popupText2.bottom
                    //anchors.left: parent.right
                    // anchors.right: parent.right
                    // anchors.bottom: parent.bottom
                    color: Qt.color("transparent")

                    ListView {
                        id: comboView

                        anchors.fill: parent
                        anchors.margins: 6
                        spacing: 6
                        // height: 400
                        implicitHeight: contentHeight
                        focus: true
                        clip: true
                        //  anchors.left: parent.left
                        // anchors.top: parent.top

                        // Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                        model: root.controllModel
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
                    }
                }
            }
        }
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

    Connections {
        target: comboView
        ignoreUnknownSignals: true

        function onUserItemSelected(data) {
            root.userItemSelected(data)
        }
    }
}
