import VPlay 2.0
import QtQuick 2.0

ListModel {
    id: item

    property bool locked: true

    property int purchasedCount: 0

    ListElement {
        imageName: "idle"
        frameCount: 4
        frameRate: 4

        state: "idle"
    }

    ListElement {
        imageName: "oven"
        frameCount: 4
        frameRate: 4

        state: "oven"
    }

    ListElement {
        imageName: "pot"
        frameCount: 4
        frameRate: 4

        state: "pot"
    }

    ListElement {
        imageName: "knife"
        frameCount: 4
        frameRate: 4

        state: "knife"
    }

    ListElement {
        imageName: "machine"
        frameCount: 2
        frameRate: 4

        state: "machine"
    }
}
