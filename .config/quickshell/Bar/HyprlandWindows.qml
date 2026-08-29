import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

Rectangle {
    implicitWidth: row.implicitWidth + 22
    implicitHeight: 30
    radius: height / 2
    color: "#000"

    Poller {
        id: root
        command: "hyprctl activewindow | grep -q class | cut -d':' -f 2"
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 7
        IconImage {
            source: root.value
        }

        // Text {
        //     text: root.label
        //     color: "#f5e2f5"
        //     font.pixelSize: 12
        //     font.family: "JetBrains Mono"
        //     elide: Text.ElideRight
        //     Layout.maximumWidth: root.maxLabelWidth
        //     visible: root.label !== ""
        // }
    }
}
