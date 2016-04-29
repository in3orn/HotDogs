import VPlay 2.0
import QtQuick 2.0

ListModel {
    id: item

    property bool locked: true

    property int purchasedCount: 0

    ListElement {
        name: qsTr("Metal grasper")
        purchased: false
        watched: false
        cost: 10

        imageName: "grasper"
        frameCount: 1
        frameRate: 0
        z: 0.6

        hiddenState: "pot"
    }

    ListElement {
        name: qsTr("Cutting board")
        purchased: false
        watched: false
        cost: 25

        imageName: "board"
        frameCount: 1
        frameRate: 0
        z: 0.5

        hiddenState: ""
    }

    ListElement {
        name: qsTr("Cap")
        purchased: false
        watched: false
        cost: 50

        imageName: "cap"
        frameCount: 1
        frameRate: 0
        z: 0.3

        hiddenState: ""
    }

    ListElement {
        name: qsTr("Sharp knife")
        purchased: false
        watched: false
        cost: 100

        imageName: "knife"
        frameCount: 1
        frameRate: 0
        z: 0.6

        hiddenState: "knife"
    }

    ListElement {
        name: qsTr("Silver pot")
        purchased: false
        watched: false
        cost: 250

        imageName: "pot"
        frameCount: 2
        frameRate: 4
        z: 0.4

        hiddenState: "pot"
    }

    ListElement {
        name: qsTr("Brand new oven")
        purchased: false
        watched: false
        cost: 500

        imageName: "oven"
        frameCount: 2
        frameRate: 0.7
        z: 0.0

        hiddenState: ""
    }

    ListElement {
        name: qsTr("Sauce machine")
        purchased: false
        watched: false
        cost: 1000

        imageName: "machine"
        frameCount: 2
        frameRate: 0.8
        z: 0.7

        hiddenState: ""
    }

    ListElement {
        name: qsTr("Peak")
        purchased: false
        watched: false
        cost: 2500

        imageName: "peak"
        frameCount: 1
        frameRate: 0
        z: 0.3

        hiddenState: ""
    }

    ListElement {
        name: qsTr("Booth")
        purchased: false
        watched: false
        cost: 5000

        imageName: "booth"
        frameCount: 1
        frameRate: 0
        z: 0.2

        hiddenState: ""
    }

    ListElement {
        name: qsTr("Bilboard")
        purchased: false
        watched: false
        cost: 10000

        imageName: "bilboard"
        frameCount: 2
        frameRate: 1
        z: 1.0

        hiddenState: ""
    }

    function load(storage) {
        purchasedCount = 0;

        for(var i = 0; i < count; i++) {
            var item = get(i);
            var data = storage.getEquipmentData(i);
            item.purchased = data.purchased;
            item.watched = data.watched;

            if(item.purchased)
                purchasedCount++;
        }
    }

    function save(storage) {
        for(var i = 0; i < count; i++) {
            var item = get(i);
            var data = storage.getEquipmentData(i);
            data.purchased = item.purchased;
            data.watched = item.watched;
            storage.setEquipmentData(i, data);
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
