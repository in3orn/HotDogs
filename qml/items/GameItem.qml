
import VPlay 2.0
import QtQuick 2.0

SpriteSequenceVPlay {
    id: item

    property string base: "items"
    property string name

    property bool upgraded

    property alias sprite: sprite

    defaultSource: "../../assets/img/" + base + "/" + name + "-" + (upgraded ? "new" : "old") + ".png"

    SpriteVPlay {
        id: sprite

        name: "main"
        frameWidth: 320
        frameHeight: 320
        startFrameColumn: 1
        to: {"main": 1}
    }
}
