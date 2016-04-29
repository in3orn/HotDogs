import VPlay 2.0
import QtQuick 2.0

import QtQuick.Layouts 1.1

import "../misc"
import "../logic"
import "../panels"

Item {
    id: item

    signal showVideoClicked(string source)

    Item {
        id: sceneRect

        anchors.centerIn: parent

        width: 320
        height: 480
    }

    Item {
        id: itemContainer
        anchors.centerIn: parent

        Repeater {
            id: chefItems

            model: gameLogic.chefs

            delegate: GameItem {
                anchors.centerIn: parent

                base: "chefs"
                name: "chef-" + model.imageName
//                upgraded: model.purchased

                sprite.frameCount: model.frameCount
                sprite.frameRate: model.frameRate

                z: 0.2

                visible: model.state === itemContainer.state
            }
        }

        Repeater {
            id: handsItems

            model: gameLogic.chefs

            delegate: GameItem {
                anchors.centerIn: parent

                base: "hands"
                name: "hands-" + model.imageName
//                upgraded: model.purchased

                sprite.frameCount: model.frameCount
                sprite.frameRate: model.frameRate

                z: 0.8

                visible: model.state === itemContainer.state
            }
        }

        Repeater {
            id: equipmentItems

            model: gameLogic.equipment

            delegate: GameItem {
                anchors.centerIn: parent

                name: model.imageName
                upgraded: model.purchased

                sprite.frameCount: model.frameCount
                sprite.frameRate: model.frameRate

                z: model.z
            }
        }

        state: getState()

        states: [
            State {
                name: "idle"
            }
        ]

        function getState() {
            return gameLogic.getState();
        }
    }

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: normalMargin

        text: qsTr("$ ") + gameLogic.cash
    }

    Text {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: normalMargin

        text: gameLogic.luck + qsTr(" T")
    }

    ProgressBar {
        id: progressBar

        anchors.horizontalCenter: sceneRect.horizontalCenter
        anchors.top: sceneRect.top
        anchors.margins: 60

        maxValue: gameLogic.craftItem.maxHealth
        value: gameLogic.craftItem.health
    }

    MouseArea {
        anchors.fill: parent

        onPressed: tap();
        onReleased: untap();
    }

    MainPanel {
        id: mainPanel

        anchors.left: parent.left
        anchors.right: parent.right

        sy: parent.height - 50
        ey: sy - height + 50

        height: parent.height/2

        onShowEquipment: {
            var item = gameLogic.equipment.get(index);
            itemDialog.title = item.name;
            itemDialog.content = "
asasdasd\n
-asd\n
-asd\n
asd\n
Qasd adadadqef asf a af adfaf\n
qefa fa fasf asf akfn aof hoaf afa";
            itemDialog.state = "shown";
        }

        onShowIngredient: {
            var item = gameLogic.ingredients.get(index);
            itemDialog.title = item.name;
            itemDialog.content = "
asasdasd\n
-asd\n
-asd\n
asd\n
Qasd adadadqef asf a af adfaf\n
qefa fa fasf asf akfn aof hoaf afa";
            itemDialog.state = "shown";
        }

        onShowTask: {
            var task = gameLogic.tasks.get(index);
            showVideoClicked(task.videoSource);
        }

        onShowShopDialog: {
            shopDialog.state = "shown";
        }
    }

    ItemDialog {
        id: itemDialog
    }

    ShopDialog {
        id: shopDialog
    }

    GameLogic {
        id: gameLogic
    }

    function tap() {
        gameLogic.craft();
    }

    function untap() {
    }
}
