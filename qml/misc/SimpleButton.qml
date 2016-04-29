import VPlay 2.0
import QtQuick 2.0

Item {
    id: button

    signal clicked
    signal pressed
    signal released

    width: buttonImage.width
    height: buttonImage.height

    property alias source: buttonImage.source

    MultiResolutionImage {
        id: buttonImage
        source: "../../assets/img/buttons/blue-square-button.png"
    }
    MouseArea {
        id: mouseArea
        enabled: button.enabled
        anchors.fill: button
        hoverEnabled: true

        onClicked: {
            button.scale = 1.0;
            button.clicked();
            audioManager.playClickSfx();
        }
        onPressed: {
            button.scale = 0.85;
        }
        onReleased: {
            button.scale = 1.0;
        }
        onCanceled: {
            button.scale = 1.0;
        }
    }
}

