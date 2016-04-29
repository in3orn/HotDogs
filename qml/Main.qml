import VPlay 2.0
import QtQuick 2.0

import "common"
import "scenes"

GameWindow {
    id: window

    //licenseKey: "<generate one from http://v-play.net/licenseKey>"

    screenWidth: 640
    screenHeight: 960

    property int smallFontSize: 8
    property int normalFontSize: 11
    property int titleFontSize: 14

    property int smallMargin: 5
    property int normalMargin: 10
    property int doubleMargin: 20

    AudioManager {
        id: audioManager
    }

    BackgroundMusic {
        id: music
        source: "../assets/music/background.mp3"
        muted: !settings.musicEnabled
    }

//    FontLoader {
//        id: customFont
//        source: "../assets/font/calibri.ttf"
//    }

    Settings {
        id: settings
    }

    DataStorage {
        id: storage
    }

    GameScene {
        id: gameScene
        opacity: 0

        onShowVideoClicked: {
            showVideo(source);
        }
    }

    VideoScene {
        id: videoScene
        opacity: 0

        onPlayingFinished: {
            window.state = "game";
        }
    }

    state: ""

    states: [
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: window; activeScene: gameScene}
        },
        State {
            name: "video"
            PropertyChanges {target: videoScene; opacity: 1}
            PropertyChanges {target: window; activeScene: videoScene}
        }
    ]

    Component.onCompleted: {
        var taskData = storage.getTaskData(0);
        if(!taskData.watched) {
            taskData.watched = true;
            storage.setTaskData(0, taskData);

            showVideo("../video/IntroVideo.qml");
        } else {
            window.state = "game";
        }
    }

    function showVideo(source) {
        videoScene.play(source);
        window.state = "video";
    }
}
