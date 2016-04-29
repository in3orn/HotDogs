import VPlay 2.0
import QtQuick 2.0

import "../misc"

Dialog {
    id: item

    property alias delegate: listView.delegate
    property alias model: listView.model

    Item {
        anchors.fill: parent

        clip: true

        ListView {
            id: listView

            anchors.fill: parent

            spacing: normalMargin
        }
    }
}
