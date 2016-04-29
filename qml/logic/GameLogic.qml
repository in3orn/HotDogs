import VPlay 2.0
import QtQuick 2.0

import "../data"

Item {
    id: item

    property int cash: 10000
    property int luck: 3

    property alias craftItem: craftItem

    property alias ingredients: ingredients
    property alias equipment: equipment
    property alias tasks: tasks

    property alias lottery: lottery

    property alias chefs: chefs

    signal itemCrafted
    signal prizeCollected

    signal equipmentUnlocked(int index)

    CraftItem {
        id: craftItem

        reward: ingredients.purchasedCount
        maxHealth: 25 - 2*equipment.purchasedCount

        onCrafted: {
            cash += reward;
            itemCrafted();
        }
    }

    Tasks {
        id: tasks
    }

    Equipment {
        id: equipment
    }

    Ingredients {
        id: ingredients
    }

    Lottery {
        id: lottery

        onCashCollected: {
            item.cash += cash;
            if(prize == 0) {
                prizeCollected()
            }
        }
    }

    Chefs {
        id: chefs
    }

    Component.onCompleted: {
        tasks.load(storage);
        equipment.load(storage);
        ingredients.load(storage);

        equipment.locked = !tasks.get(1).completed;
        ingredients.locked = !tasks.get(2).completed;
        lottery.locked = !tasks.get(3).completed;
    }

    Component.onDestruction: {
        tasks.save(storage);
        equipment.save(storage);
        ingredients.save(storage);
    }

    function craft() {
        craftItem.craft();
    }




    function unlockIngredient(index) {
        var item = ingredients.get(index);
        gameLogic.cash -= item.cost;
        ingredients.unlock(index);
    }

    function unlockEquipment(index) {
        var item = equipment.get(index);
        gameLogic.cash -= item.cost;
        equipment.unlock(index);


    }

    function completeTask(index) {
        var item = tasks.get(index);
        gameLogic.cash -= item.cost;
        tasks.complete(index);

        switch(index) {
        case 1:
            equipment.locked = false;
            break;
        case 2:
            ingredients.locked = false;
            break;
        case 3:
            lottery.locked = false;
            break;
        }
    }




    function canRunLottery() {
        return lottery.canRun();
    }

    function runLottery() {
        if(canRunLottery()) {
            luck--;
        }
    }

    function setLotteryPrize(prize) {
        lottery.setPrize(prize);
    }

    function getState() {
        if(craftItem.health == 0) {
            return "idle";
        }
        if(craftItem.health < 0.25 * (craftItem.maxHealth-1)) {
            return "oven";
        }
        if(craftItem.health < 0.50 * (craftItem.maxHealth-1)) {
            return "pot";
        }
        if(craftItem.health < 0.75 * (craftItem.maxHealth-1)) {
            return "knife";
        }
        return "machine";
    }
}
