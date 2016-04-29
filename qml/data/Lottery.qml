
import VPlay 2.0
import QtQuick 2.0

Item {
    id: item

    property bool locked: true

    property int prize: 0
    property int dPrize: 0

    signal cashCollected(int cash)

    Timer {
        id: prizeDelayTimer
        interval: 1000

        onTriggered: prizeTimer.restart();
    }

    Timer {
        id: prizeTimer
        interval: 100
        repeat: prize > 0

        onTriggered: {
            if(prize > dPrize) {
                prize -= dPrize;
                cashCollected(dPrize);
            } else {
                dPrize = prize;
                prize = 0;
                cashCollected(dPrize);
            }
        }
    }

    function canRun() {
        return !locked && prize == 0;
    }

    function setPrize(prize) {
        item.prize = prize;
        dPrize = prize / 10;

        prizeDelayTimer.restart();
    }
}
