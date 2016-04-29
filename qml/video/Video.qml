
import VPlay 2.0
import QtQuick 2.0

import "../misc"

Item {
    id: item

    signal ended

    Timer {
        id: timer
        interval: 5000

        onTriggered: item.stop();
    }

    IconButton {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: normalMargin

        source: "../../assets/img/buttons/red-square-button.png"
        iconSource: "../../assets/img/buttons/cross.png"

        onClicked: stop();
    }

    IconButton {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: normalMargin

        source: "../../assets/img/buttons/blue-square-button.png"
        iconSource: "../../assets/img/buttons/cross.png"

        onClicked: settings.soundEnabled = !settings.soundEnabled;
    }

    Component.onCompleted: play();

    function play() {
        timer.start();
    }

    function stop() {
        timer.stop();
        ended();
    }
}
