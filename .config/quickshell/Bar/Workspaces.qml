import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
    implicitWidth: row.implicitWidth + 22
    implicitHeight: 30
    radius: height / 2
    color: "#000"

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 8

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                implicitWidth: 20
                implicitHeight: implicitWidth
                radius: width / 2
                border.width: 0.5
                border.color: modelData.active ? "#3df" : "#888"
                color: "#000"
                opacity: 0.8

                Text {
                    id: hyprlandId
                    anchors.centerIn: parent
                    text: modelData.id
                    font.family: "JetBrains Mono"
                    font.pixelSize: 10
                    color: "white"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: modelData.activate()
                }
            }
        }
    }
}
