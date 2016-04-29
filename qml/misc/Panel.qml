import VPlay 2.0
import QtQuick 2.0

Item {
    id: item

    property int sy: 0
    property int ey: 0

    property int moveTime: 500

    y: sy

    states: [
        State {
            name: "shown"
            PropertyChanges {target: item; y: ey}
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "shown"
            reversible: true

            ParallelAnimation {
                NumberAnimation {
                    properties: "y";
                    duration: moveTime;
                    easing.type: Easing.InOutQuad
                }
            }
        }
    ]
}

