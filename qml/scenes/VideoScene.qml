import VPlay 2.0
import QtQuick 2.0

import "../items"
import "../video"

Scene {
    id: scene

    width: 320
    height: 480

    signal loadingFinished
    signal playingFinished

    Splash {
        id: splash
    }

    Loader {
        id: loader

        anchors.fill: gameWindowAnchorItem

        opacity: 0.0

        asynchronous: true

        onLoaded: {
            scene.loadingFinished();
            scene.state = "playing";
        }
    }

    Connections {
        target: loader.item
        onEnded: stop();
    }

    state: "loading"

    states: [
        State {
            name: "loading"
        },
        State {
            name: "playing"
        }
    ]

    transitions: [
        Transition {
            from: "loading"
            to: "playing"

            NumberAnimation {
                target: splash
                property: "opacity"
                duration: 2000
                easing.type: Easing.InOutQuad
                to: 0.0
            }

            NumberAnimation {
                target: loader
                property: "opacity"
                duration: 2000
                easing.type: Easing.InOutQuad
                to: 1.0
            }
        }
    ]

    function play(videoSource) {
        loader.source = videoSource;
    }

    function stop() {
        loader.source = "";
        playingFinished();
    }
}
