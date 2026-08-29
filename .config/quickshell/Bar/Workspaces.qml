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
                implicitWidth: 15
                implicitHeight: implicitWidth
                radius: width / 2
                border.width: 2
                border.color: modelData.active ? "#3df" : "#888"

                MouseArea {
                    anchors.fill: parent
                    onClicked: modelData.activate()
                }
            }
        }
    }
}
