import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string icon: ""
    property string label: ""
    property color iconColor: "#3df"
    property int maxLabelWidth: 400

    implicitWidth: row.implicitWidth + 22
    implicitHeight: 28
    radius: height / 2
    color: "#040e0d"

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 7
        Text {
            text: root.icon
            color: root.iconColor
            font.family: "Material Symbols Rounded"
            font.pixelSize: 12
        }
        Text {
            text: root.label
            color: "#f5e2f5"
            font.pixelSize: 12
            font.family: "JetBrains Mono"
            elide: Text.ElideRight
            Layout.maximumWidth: root.maxLabelWidth
            visible: root.label !== ""
        }
    }
}
