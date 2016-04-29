
import VPlay 2.0
import QtQuick 2.0

ListModel {
    id: item

    property int completedCount: 0

    ListElement {
        name: "Intro"
        cost: 0
        tickets: 0
        rewardValue: qsTr("")
        rewardUom: qsTr("")
        completed: true
        watched: false
        videoSource: "../video/IntroVideo.qml"
    }

    ListElement {
        name: "On my own"
        cost: 10
        tickets: 0
        rewardValue: qsTr("own")
        rewardUom: qsTr("booth")
        completed: false
        watched: false
        videoSource: "../video/OnMyOwnVideo.qml"
    }

    ListElement {
        name: "Gordons path"
        cost: 100
        tickets: 0
        rewardValue: qsTr("new")
        rewardUom: qsTr("recipes")
        completed: false
        watched: false
        videoSource: "../video/GordonsPathVideo.qml"
    }

    ListElement {
        name: "Hope in lottery"
        cost: 1000
        tickets: 3
        rewardValue: ""
        rewardUom: ""
        completed: false
        watched: false
        videoSource: "../video/HopeInLotteryVideo.qml"
    }

    ListElement {
        name: "Hot-dog love"
        cost: 10000
        tickets: 10
        rewardValue: ""
        rewardUom: ""
        completed: false
        watched: false
        videoSource: "../video/HotDogLoveVideo.qml"
    }

    ListElement {
        name: "Caring mafia"
        cost: 100000
        tickets: 25
        rewardValue: ""
        rewardUom: ""
        completed: false
        watched: false
        videoSource: "../video/CaringMafiaVideo.qml"
    }

    ListElement {
        name: "Total destruction"
        cost: 1000000
        tickets: 0
        rewardValue: "own"
        rewardUom: "ion cannon"
        completed: false
        watched: false
        videoSource: "../video/TotalDestructionVideo.qml"
    }

    function load(storage) {
        completedCount = 0;

        for(var i = 0; i < count; i++) {
            var item = get(i);
            var data = storage.getTaskData(i);
            item.completed = data.completed;
            item.watched = data.watched;

            if(item.completed)
                completedCount++;
        }
    }

    function save(storage) {
        for(var i = 0; i < count; i++) {
            var item = get(i);
            var data = storage.getTaskData(i);
            data.completed = item.completed;
            data.watched = item.watched;
            storage.setTaskData(i, data);
        }
    }

    function complete(index) {
        var item = get(index);
        item.completed = true;
        completedCount++;
    }

    function setWatched(index) {
        var item = get(index);
        item.watched = true;
    }
}
