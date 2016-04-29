
import VPlay 2.0
import QtQuick 2.0

ListModel {
    id: item

    property bool locked: true

    property int purchasedCount: 1

    ListElement {
        name: qsTr("Roll & sausage")
        purchased: true
        watched: true
        cost: 0
    }

    ListElement {
        name: qsTr("Ketchup")
        purchased: false
        watched: false
        cost: 5
    }

    ListElement {
        name: qsTr("Mustard")
        purchased: false
        watched: false
        cost: 10
    }

    ListElement {
        name: qsTr("Mayonnaise")
        purchased: false
        watched: false
        cost: 25
    }

    ListElement {
        name: qsTr("Salad")
        purchased: false
        watched: false
        cost: 50
    }

    ListElement {
        name: qsTr("Cucumber")
        purchased: false
        watched: false
        cost: 100
    }

    ListElement {
        name: qsTr("Onion")
        purchased: false
        watched: false
        cost: 250
    }

    ListElement {
        name: qsTr("Tomato")
        purchased: false
        watched: false
        cost: 500
    }

    ListElement {
        name: qsTr("Garlic")
        purchased: false
        watched: false
        cost: 1000
    }

    ListElement {
        name: qsTr("Cheese")
        purchased: false
        watched: false
        cost: 2500
    }

    function load(storage) {
        purchasedCount = 0;

        for(var i = 0; i < count; i++) {
            var item = get(i);
            var data = storage.getIngredientData(i);
            item.purchased = data.purchased;
            item.watched = data.watched;

            if(item.purchased)
                purchasedCount++;
        }
    }

    function save(storage) {
        for(var i = 0; i < count; i++) {
            var item = get(i);
            var data = storage.getIngredientData(i);
            data.purchased = item.purchased;
            data.watched = item.watched;
            storage.setIngredientData(i, data);
        }
    }

    function unlock(index) {
        var item = get(index);
        item.purchased = true;
        purchasedCount++;
    }

    function setWatched(index) {
        var item = get(index);
        item.watched = true;
    }
}
