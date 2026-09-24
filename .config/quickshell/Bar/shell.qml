import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris

PanelWindow {
    id: bar

    anchors {
        bottom: true
        left: true
        right: true
    }

    implicitHeight: 28
    color: "transparent"

    Poller {
        id: clock
        command: "date +%H:%M"
        interval: 60000
    }

    Poller {
        id: vol
        command: "wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf\"%d\", $2 * 100}'"
        interval: 1000
    }

    Poller {
        id: bat
        command: "cat /sys/class/power_supply/BAT1/capacity"
        interval: 10000
    }

    Poller {
        id: bt
        command: "bluetoothctl show | grep -q 'Powered: yes' && echo on || echo off"
        interval: 3000
    }

    Poller {
        id: prayer
        command: "cat /tmp/prayer-notify.json | jq '.text' -r"
        interval: 1000
    }

    Poller {
        id: net
        command: "NO_COLOR=1 nmcli -t -f NAME connection show --active | head -n1"
        interval: 5000
    }

    property int current_player: 0
    readonly property var player: Mpris.players.values.find(p => p.isPlaying) ?? Mpris.players.values[current_player] ?? null

    RowLayout {
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 8
        }

        Pill {
            icon: "nest_clock_farsight_analog"
            label: clock.value + ""
            iconColor: "#888"
        }

        Pill {
            icon: "mosque"
            label: prayer.value + ""
            iconColor: "#888"
        }

        HyprlandWindows {}
    }

    Workspaces {
        anchors.centerIn: parent
    }

    RowLayout {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
            rightMargin: 14
        }
        spacing: 8

        Pill {
            icon: "music_note"
            maxLabelWidth: 200
            label: bar.player ? `${bar.player.trackArtist || "unknown"} -- ${bar.player.trackTitle || ""}` : "Nothing"
            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if (bar.player.isPlaying) {
                        bar.player.pause();
                    } else {
                        bar.player.play();
                    }
                }
                onDoubleClicked: {
                    bar.current_player = (bar.current_player + 1) % (Mpris.players?.values?.length ?? 1);
                }
            }
        }

        Pill {
            icon: "volume_up"
            label: vol.value + "%"
            iconColor: "#888"
        }

        Pill {
            icon: "bluetooth"
            label: bt.value
            iconColor: "#888"
        }

        Pill {
            icon: "android_wifi_3_bar"
            label: net.value
            iconColor: "#888"
        }

        Pill {
            icon: "battery_android_full"
            label: bat.value + "%"
            iconColor: "#888"
        }
    }
}
