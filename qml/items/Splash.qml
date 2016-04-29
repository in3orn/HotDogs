import VPlay 2.0
import QtQuick 2.0

import QtQuick.Layouts 1.1

Rectangle {
    id: item

    anchors.fill: gameWindowAnchorItem

    color: "white"

    ColumnLayout {
        anchors.centerIn: parent

        MultiResolutionImage {
            id: logo

            source: "../../assets/img/misc/krk-logo.png"

            Layout.alignment: Qt.AlignCenter
        }

        Text {
            id: loadingText

            text: qsTr("Loading...")

            Layout.alignment: Qt.AlignCenter

            SequentialAnimation on opacity {
                loops: Animation.Infinite
                PropertyAnimation {
                    to: 0
                    duration: 1000
                }
                PropertyAnimation {
                    to: 1
                    duration: 1000
                }
            }
        }
    }
}
