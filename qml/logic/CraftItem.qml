import VPlay 2.0
import QtQuick 2.0

Item {
    id: item

    property int maxHealth: 25
    property int health: 0

    property int reward: 1

    signal crafted

    function init() {
        health = 0;
    }

    function craft() {
        health++;
        checkCrafted();
    }

    function checkCrafted() {
        if(health >= maxHealth) {
            init();
            crafted();
        }
    }
}
