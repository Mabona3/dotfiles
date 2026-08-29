import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

import "Config.js" as Config

Scope {
    id: root
    property bool centerOpen: false
    property var history: Array()

    NotificationServer {
        id: server
        actionsSupported: true
        imageSupported: true
        bodySupported: true
        onNotification: n => {
            root.history.unshift({
                summary: n.summary,
                body: n.body,
                appName: n.appName,
                urgency: n.urgency,
                time: Qt.formatDateTime(new Date(), "HH:mm")
            });
            n.tracked = true;
        }
    }

    IpcHandler {
        target: "notifications"
        function toggle(): void {
            root.centerOpen = !root.centerOpen;
        }
        function show(): void {
            root.centerOpen = true;
        }
        function hide(): void {
            root.centerOpen = false;
        }
    }

    PanelWindow {
        anchors.top: true
        anchors.right: true
        margins.top: 12
        margins.right: 12

        implicitWidth: 300
        implicitHeight: Math.max(100, column.implicitHeight)
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"

        ColumnLayout {
            id: column
            width: parent.width
            spacing: 10

            Repeater {
                model: server.trackedNotifications
                delegate: Rectangle {
                    id: card
                    required property var modelData

                    Timer {
                        interval: 1000
                        running: true
                        onTriggered: card.modelData.dismiss()
                    }

                    Layout.fillWidth: true
                    Layout.preferredHeight: layout.implicitHeight + 20
                    radius: 8
                    color: "#ffffff"
                    border.width: 2
                    border.color: "#000000"
                    RowLayout {
                        id: layout
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        Image {
                            Layout.preferredHeight: 36
                            Layout.preferredWidth: 36
                            Layout.alignment: Qt.AlignTop
                            fillMode: Image.PreserveAspectFit
                            visible: source.toString() !== ""
                            source: card.modelData.image || card.modelData.appIcon || ""
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Text {
                                Layout.fillWidth: true
                                text: card.modelData.summary
                                color: "#000000"
                                font.pixelSize: 18
                                font.bold: true
                                elide: Text.ElideRight
                            }

                            Text {
                                Layout.fillWidth: true
                                text: card.modelData.body
                                visible: text != ""
                                color: "#000000"
                                font.pixelSize: 8
                                wrapMode: Text.WordWrap
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: card.modelData.dismiss()
                    }
                }
            }
        }
    }

    // Notification center
    PanelWindow {
        visible: root.centerOpen
        anchors.top: true
        anchors.right: true
        margins.top: 12
        margins.right: 12

        implicitWidth: 300
        implicitHeight: centerCol.implicitHeight + 24
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            radius: 10
            border.width: 2
            border.color: "black"

            ColumnLayout {
                id: centerCol
                anchors.fill: parent
                anchors.margins: 8
                spacing: 8

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 6

                    Text {
                        Layout.fillWidth: true
                        text: "Notifications"
                        color: "black"
                        font.pixelSize: 18
                        font.bold: true
                    }
                    Text {
                        text: "Clear All"
                        visible: model.length > 0
                        color: "black"
                        MouseArea {
                            onClicked: model.clear()
                        }
                    }
                }
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 6

                    Text {
                        Layout.fillWidth: true
                        text: model.summary
                        color: "#000000"
                        font.pixelSize: 18
                        font.bold: true
                        elide: Text.ElideRight
                    }
                    Text {
                        text: model.time
                        font.pixelSize: 12
                    }
                    Text {
                        text: "x"
                        font.pixelSize: 10
                        MouseArea {
                            onClicked: {
                                root.history.remove(index);
                            }
                        }
                    }
                }
                Text {
                    Layout.fillWidth: true
                    text: model.body
                    visible: text != ""
                    color: "#000000"
                    font.pixelSize: 8
                    wrapMode: Text.WordWrap
                }
                Text {
                    text: model.appName
                    visible: text != ""
                }
            }
        }
    }
}
