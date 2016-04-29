import VPlay 2.0
import QtQuick 2.0

import QtQuick.Layouts 1.1

Dialog {
    id: item

    MouseArea {
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent

        color: "black"
        opacity: 0.5
    }

    Rectangle {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: doubleMargin

        width: 280

        color: "#333333"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: normalMargin

            Text {
                text: "Lottery tickets"
                color: "white"

                font.pixelSize: titleFontSize

                Layout.alignment: Qt.AlignCenter
            }

            Item {
                Layout.fillHeight: true
            }

            TextButton {
                text: qsTr("Back")
                textColor: "white"

                source: "../../assets/img/buttons/blue-purchase-button.png"

                Layout.alignment: Qt.AlignCenter

                onClicked: item.state = "";
            }
        }

        IconButton {
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: normalMargin

            source: "../../assets/img/buttons/red-square-button.png"
            iconSource: "../../assets/img/buttons/cross.png"

            onClicked: item.state = "";
        }
    }
}
