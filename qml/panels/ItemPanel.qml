import VPlay 2.0
import QtQuick 2.0

import QtQuick.Layouts 1.1

import "../misc"

Rectangle {
    anchors.left: parent.left
    anchors.right: parent.right

    height: 70

    color: "#333333"

    property string name
    property int cost

    property bool purchased

    property alias rewardLabel: rewardLabel
    property alias rewardValue: rewardValue
    property alias rewardUom: rewardUom

    signal unlockClicked
    signal showClicked

    RowLayout {
        anchors.fill: parent
        anchors.margins: normalMargin

        MultiResolutionImage {
            source: "../../assets/img/buttons/blue-avatar-button.png"
        }

        ColumnLayout {
            Text {
                text: name
                color: "white"

                font.pixelSize: normalFontSize
            }

            Item { Layout.fillHeight: true }

            RowLayout {
                Text {
                    id: rewardLabel
                    color: "white"

                    font.pixelSize: smallFontSize
                }

                Text {
                    id: rewardValue
                    color: "green"

                    font.pixelSize: smallFontSize
                }

                Text {
                    id: rewardUom
                    color: "white"

                    font.pixelSize: smallFontSize
                }
            }
        }

        Item { Layout.fillWidth: true }

        ColumnLayout {
            Item { Layout.fillHeight: true }

            SimpleButton {
                id: unlockButton

                source: "../../assets/img/buttons/blue-purchase-button.png"

                ColumnLayout {
                    anchors.centerIn: parent

                    spacing: 0

                    Text {
                        text: qsTr("Buy")
                        color: "white"
                        font.pixelSize: normalFontSize

                        Layout.alignment: Qt.AlignCenter
                    }

                    Text {
                        text: cost + qsTr("$")
                        color: "white"
                        font.pixelSize: smallFontSize

                        Layout.alignment: Qt.AlignCenter
                    }
                }

                visible: !purchased
                enabled: cost <= gameLogic.cash

                onClicked: unlockClicked();
            }

            TextButton {
                id: showButton

                source: "../../assets/img/buttons/green-purchase-button.png"

                text: qsTr("show")
                textColor: "white"

                visible: purchased
                enabled: purchased

                onClicked: showClicked();
            }
        }
    }
}
