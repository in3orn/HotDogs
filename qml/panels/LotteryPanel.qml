import VPlay 2.0
import QtQuick 2.0

import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

import "../misc"
import "../items"

Dialog {
    id: item

    signal showShopDialog

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: normalMargin

        spacing: normalMargin

        Roulette {
            id: roulette

            Layout.fillWidth: true

            onSpinEnded: {
                prizeLabel.state = "shown";
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Text {
                id: prizeLabel

                anchors.centerIn: parent

                text: gameLogic.lottery.prize + qsTr(" $")
                color: "white"

                scale: 0

                onTextChanged: {
                    if(gameLogic.lottery.prize <= 0) {
                        state = "";
                    }
                }

                states: [
                    State {
                        name: "shown"
                        PropertyChanges {
                            target: prizeLabel
                            scale: 1
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: ""
                        to: "shown"
                        reversible: true

                        animations: [
                            NumberAnimation {
                                target: prizeLabel
                                property: "scale"
                                duration: 250
                                easing.type: Easing.InOutQuad
                            }
                        ]
                    }
                ]
            }
        }

        Text {
            Layout.alignment: Qt.AlignCenter

            text: qsTr("")
            color: "white"
        }

        Item { Layout.fillHeight: true }

        TextButton {
            Layout.alignment: Qt.AlignCenter

            text: qsTr("Play!")
            textColor: "white"

            enabled: gameLogic.canRunLottery() && !roulette.spinning && !roulette.stopping

            onClicked: {
                prizeLabel.state = "";

                if(gameLogic.luck > 0) {
                    gameLogic.runLottery();
                    roulette.spin(3000);
                } else {
                    showShopDialog();
                }
            }
        }
    }
}
