import VPlay 2.0
import QtQuick 2.0

SlotMachine {
    id: slotMachine

    reelCount: 3
    rowCount: 1

    defaultReelWidth: 80
    defaultItemHeight: 80

    model: SlotMachineModel {
        symbols: {
            "square":    { frequency: 7, data: "square.png" },
            "circle":    { frequency: 5, data: "circle.png" },
            "triangle":  { frequency: 3, data: "triangle.png" },
            "diamond" :  { frequency: 1, data: "diamond.png" }
        }
    }

    delegate: Item {
        Image {
            id: image
            source: "../../assets/img/slots/" + modelData.data
            anchors.fill: parent

            scale: 0.8
        }

        SequentialAnimation {
            id: winAnimation

            NumberAnimation {
                target: image
                property: "scale"
                duration: 250
                to: 1.0
            }
            NumberAnimation {
                target: image
                property: "scale"
                duration: 250
                to: 0.8
            }
        }

        function startWinAnimation() {
            winAnimation.start()
        }
    }

    onSpinEnded: {
        var length = 0
        var firstSymbol = null

        for(var reelIndex = 0; reelIndex < slotMachine.reelCount; reelIndex++) {
            var modelData = slotMachine.getItemData(reelIndex, 0)
            if(firstSymbol == null)
            firstSymbol = modelData.type

            if(modelData.type === firstSymbol) {
                length++
            } else {
                break;
            }
        }

        if(length >= 2) {
            for(var winIndex = 0; winIndex < length; winIndex++) {
                var image = slotMachine.getItem(winIndex, 0)
                image.startWinAnimation();
            }

            var prize = 0;

            switch(firstSymbol) {
            case "diamond":
                prize = 1000000;
                break;
            case "triangle":
                prize = 100000;
                break;
            case "circle":
                prize = 10000;
                break;
            case "rect":
            default:
                prize = 1000;
                break;
            }

            if(length < 3) prize /= 10;

            gameLogic.setLotteryPrize(prize);
            return;
        }

        gameLogic.setLotteryPrize(10);
    }
}
