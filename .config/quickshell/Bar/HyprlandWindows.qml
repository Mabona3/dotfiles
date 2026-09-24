import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Hyprland

Rectangle {
    implicitWidth: row.implicitWidth + 20
    implicitHeight: 25
    radius: height / 2
    color: "#000"
    visible: window.text !== ""

    property var activeWindow: Hyprland.activeToplevel
    property var validToplevel: (activeWindow && focusedWs && activeWindow.workspace?.id == focusedWs.id) ? activeWindow : null

    property string appId: validToplevel?.wayland?.appId ?? ""
    property string winTitle: validToplevel?.title ?? ""
    property var desktopEntry: DesktopEntries.heuristicLookup(appId)

    property var focusedWs: Hyprland.focusedMonitor?.activeWorkspace

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 6
        IconImage {
            id: windowImage
            source: Quickshell.iconPath(desktopEntry?.icon ?? "", "")
            implicitSize: 16
        }

        Text {
            id: window
            text: winTitle
            color: "#f5e2f5"
            font.pixelSize: 10
            font.family: "JetBrains Mono"
            elide: Text.ElideRight
            Layout.maximumWidth: 400
            visible: window.text !== ""
        }
    }
}
