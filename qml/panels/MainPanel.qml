import VPlay 2.0
import QtQuick 2.0

import QtQuick.Layouts 1.1

import "../misc"

Panel {
    id: item

    property alias buttons: buttons

    signal showIngredient(int index)
    signal showEquipment(int index)
    signal showTask(int index)

    signal showShopDialog

    MouseArea {
        anchors.fill: parent
    }

    Rectangle {
        anchors.fill: parent
        color: "black"

        opacity: 0.5
    }

    ColumnLayout {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: normalMargin

        spacing: normalMargin

        width: 300

        RowLayout {
            id: buttons

            Layout.fillWidth: true
            spacing: normalMargin

            TextButton {
                source: "../../assets/img/buttons/blue-rect-button.png"

                text: "T"
                textColor: tasksTab.state === "shown" ? "red" : "white"

                onClicked: {
                    if(item.state === "")
                        item.state = "shown";

                    tasksTab.state = "shown";
                    ingredientsTab.state = "";
                    equipmentTab.state = "";
                    lotteryTab.state = "";
                }
            }

            TextButton {
                source: "../../assets/img/buttons/purple-rect-button.png"

                text: "E"
                textColor: equipmentTab.state === "shown" ? "purple" : "white"

                visible: !gameLogic.equipment.locked

                onClicked: {
                    if(item.state === "")
                        item.state = "shown";

                    tasksTab.state = "";
                    ingredientsTab.state = "";
                    equipmentTab.state = "shown";
                    lotteryTab.state = "";
                }
            }

            TextButton {
                source: "../../assets/img/buttons/green-rect-button.png"

                text: "I"
                textColor: ingredientsTab.state === "shown" ? "green" : "white"

                visible: !gameLogic.ingredients.locked

                onClicked: {
                    if(item.state === "")
                        item.state = "shown";

                    tasksTab.state = "";
                    ingredientsTab.state = "shown";
                    equipmentTab.state = "";
                    lotteryTab.state = "";
                }
            }

            TextButton {
                source: "../../assets/img/buttons/yellow-rect-button.png"

                text: "L"
                textColor: lotteryTab.state === "shown" ? "yellow" : "white"

                visible: !gameLogic.lottery.locked

                onClicked: {
                    if(item.state === "")
                        item.state = "shown";

                    tasksTab.state = "";
                    ingredientsTab.state = "";
                    equipmentTab.state = "";
                    lotteryTab.state = "shown";
                }
            }

            Item { Layout.fillWidth: true }

            IconButton {
                id: switchButton
                source: "../../assets/img/buttons/blue-square-button.png"

                MultiResolutionImage {
                    anchors.centerIn: parent
                    source: item.state === "" ? "../../assets/img/buttons/arrow-up.png" :
                                                "../../assets/img/buttons/arrow-down.png"
                }

                onClicked: {
                    if(item.state === "")
                        item.state = "shown";
                    else
                        item.state = "";
                }
            }
        }

        Item {
            id: tabs

            Layout.fillWidth: true
            Layout.fillHeight: true

            ListPanel {
                id: tasksTab
                anchors.fill: parent
                state: "shown"

                model: gameLogic.tasks

                delegate: ItemPanel {
                    name: model.name
                    cost: model.cost

                    rewardLabel.text: qsTr("Reward:")

                    rewardValue.text: model.tickets > 0 ? model.tickets : model.rewardValue
                    rewardValue.color: "green"

                    rewardUom.text: model.tickets > 0 ? qsTr("tickets") : model.rewardUom

                    purchased: model.completed

                    onUnlockClicked: {
                        gameLogic.completeTask(model.index);

                        var item = gameLogic.tasks.get(model.index).watched;
                        if(!item.watched) {
                            item.watched = true;
                            showTask(model.index);
                        }
                    }

                    onShowClicked: showTask(model.index);
                }
            }

            ListPanel {
                id: equipmentTab
                anchors.fill: parent
                state: ""

                model: gameLogic.equipment

                delegate: ItemPanel {
                    name: model.name
                    cost: model.cost

                    rewardLabel.text: qsTr("Hot-dog craft speed:")
                    rewardValue.text: "-2"
                    rewardValue.color: "red"
                    rewardUom.text: qsTr("clicks")

                    purchased: model.purchased

                    onUnlockClicked: {
                        gameLogic.unlockEquipment(model.index);

                        var item = gameLogic.equipment.get(model.index).watched;
                        if(!item.watched) {
                            item.watched = true;
                            showEquipment(model.index);
                        }
                    }

                    onShowClicked: showEquipment(model.index);
                }
            }

            ListPanel {
                id: ingredientsTab
                anchors.fill: parent
                state: ""

                model: gameLogic.ingredients

                delegate: ItemPanel {
                    name: model.name
                    cost: model.cost

                    rewardLabel.text: qsTr("Hot-dog price:")
                    rewardValue.text: "+1"
                    rewardValue.color: "green"
                    rewardUom.text: qsTr("$")

                    purchased: model.purchased

                    onUnlockClicked: {
                        gameLogic.unlockIngredient(model.index);

                        var item = gameLogic.ingredients.get(model.index).watched;
                        if(!item.watched) {
                            item.watched = true;
                            showIngredient(model.index);
                        }
                    }

                    onShowClicked: showIngredient(model.index);
                }
            }

            LotteryPanel {
                id: lotteryTab
                anchors.fill: parent
                state: ""

                onShowShopDialog: item.showShopDialog()
            }
        }
    }

    RowLayout {
        anchors.left: parent.left
        anchors.bottom: parent.top
        anchors.margins: normalMargin

        Text {
            text: qsTr("P: ")
            color: "white"
        }

        Text {
            text: gameLogic.craftItem.reward
            color: "green"
        }
    }
}

