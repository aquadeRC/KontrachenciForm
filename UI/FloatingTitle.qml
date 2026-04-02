pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: placeholdetText
    property string labelValue

    z: 5
    anchors {
        left: parent.left
        baseline: parent.top
        leftMargin: 5
        topMargin: 10
    }
    color: "#ffffff"
    border.color: "#ffffff"

    Text {
        anchors.fill: placeholdetText

        color: "#646870"
        text: placeholdetText.labelValue
        font.pixelSize: 9
        verticalAlignment: Text.AlignVCenter
    }
}
