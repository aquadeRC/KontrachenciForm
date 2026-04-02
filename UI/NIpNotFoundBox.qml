pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls.Windows
import QtQuick.Layouts

Rectangle {
    id: root
    property int filteredItems: 0
    property AbstractItemModel nipModel

    signal userItemSelected(string data)

    focus: true
    radius: 5
    border.color: "#669fd4"
    color: "#f2f7fb"
    anchors.fill: parent

    property string fakeData: "Tadeusz Małecki#6692125698#698226102##t.malecki@gmail.com#75-727#Białogard#Chrzanowskiego 16/9"

    implicitHeight: 240
    ColumnLayout {
        id: layput1
        spacing: 9
        anchors {
            fill: parent
            margins: 12
        }

        Rectangle {
            width: 82
            height: 5
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            color: "transparent"
        }
        Rectangle {
            id: notFoundRect
            width: 82
            height: 82
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Image {
                anchors.fill: notFoundRect
                source: "Ikony/Files_has_not_found.png"
                fillMode: Image.PreserveAspectFit
            }
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            id: popupText
            color: "#000000"
            text: "Nie naleziono kontrachenta w bazie programu"
            font.pixelSize: 12
            verticalAlignment: Text.AlignVCenter
        }

        Rectangle {
            id: itemBox
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop

            focus: true
            implicitHeight: 91

            color: Qt.color("transparent")

            ColumnLayout {
                spacing: 0
                anchors.fill: itemBox
                focus: true
                implicitHeight: gusRect.height + 12 + upperRect.height + lowerRecrt.height
                RowLayout {
                    Rectangle {
                        id: gusRect
                        width: 21
                        height: 21
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignLeft
                        Image {
                            anchors.fill: parent
                            source: "Ikony/GlobeSearchNIP.svg"
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                    Text {
                        id: popupText3
                        color: "#000000"
                        text: "Dane znalezione w systemie GUS"
                        // anchors.top: parent.top
                        // anchors.left: parent.left
                        //Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                        font.pixelSize: 12
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                    }
                }
                Rectangle {
                    id: upperRect
                    color: "#ffffff"
                    border.color: "#d7dadf"
                    topLeftRadius: 5
                    topRightRadius: 5
                    Layout.preferredWidth: 462
                    Layout.preferredHeight: 32
                    focus: true

                    RowLayout {
                        spacing: 6
                        anchors {
                            fill: upperRect
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
                                color: "#000000"
                                text: "BUDIMEX SA"
                                verticalAlignment: Text.AlignVCenter

                                font.pixelSize: 12
                            }
                        }

                        RowLayout {
                            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                            Image {
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                source: "Ikony/NIP.svg"
                                fillMode: Image.PreserveAspectFit
                            }
                            Text {
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                color: "#000000"
                                text: "6692125698"
                                verticalAlignment: Text.AlignVCenter

                                font.pixelSize: 12
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: upperRect
                        hoverEnabled: true
                        onDoubleClicked: {
                            root.userItemSelected(root.fakeData)
                        }
                    }
                }
                Rectangle {
                    id: lowerRecrt
                    color: "#f5f6f7"
                    border.color: "#d7dadf"
                    bottomLeftRadius: 5
                    bottomRightRadius: 5
                    Layout.preferredWidth: 462
                    Layout.preferredHeight: 32
                    focus: true
                    RowLayout {
                        spacing: 6
                        anchors {
                            fill: lowerRecrt
                            leftMargin: 12
                            rightMargin: 12
                        }

                        RowLayout {
                            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                            Image {
                                // anchors.fill: iconRect
                                source: "Ikony/Info.svg"
                                fillMode: Image.PreserveAspectFit
                            }
                            Text {
                                color: "#000000"
                                text: "Chrzanowskieg0 16/8, Białograd"
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
                                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                                color: "#000000"
                                text: "660 495 789"
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: lowerRecrt
                        hoverEnabled: true
                        onDoubleClicked: {
                            root.userItemSelected(root.fakeData)
                        }
                    }
                }
            }
        }
    }
}
