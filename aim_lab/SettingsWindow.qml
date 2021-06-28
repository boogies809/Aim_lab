import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: settingsWindow
    title: qsTr("Aim Lab")
    property int size: 100
    property int timerInterval: 500
    property int maxCount: 10
    property var backgroundID: "qrc:/resources/images/background_game2.jpg"
    property var colorСircles: "red"

    function changingСolor(value) {
        var array = ["red", "green", "blue"]

        if(value === 0) {
            if(colorСircles === array[0])
                colorСircles = array[array.length - 1];
            else {
                colorСircles = array[array.indexOf(colorСircles) - 1];
            }
        }
        else {
            if(colorСircles === array[array.length - 1])
                colorСircles = array[0];
            else {
                colorСircles = array[array.indexOf(colorСircles) + 1];
            }
        }
    }

    function changingInterval(value) {
        if(value === 0) {
            if(timerInterval === 50)
                return;
            else
                timerInterval -= 50;
        }
        else {
            if(timerInterval === 5000)
                return;
            else
                timerInterval += 50;
        }
    }

    function changingMax(value) {
        if(value === 0) {
            if(maxCount === 4) {
                --maxCount;
                windowMaxLeftButton.visible = false;
                return;
            }
            else {
                windowMaxRightButton.visible = true;
                --maxCount;
            }
        }
        else {
            if(maxCount === 14) {
                ++maxCount;
                windowMaxRightButton.visible = false;
                return;
            }
            else {
                windowMaxLeftButton.visible = true;
                ++maxCount;
            }
        }
    }

    function changingBackground(value) {
        var array = ["qrc:/resources/images/background_game.jpg",
                     "qrc:/resources/images/background_game2.jpg",
                     "qrc:/resources/images/background_game3.jpg",
                     "qrc:/resources/images/background_game4.jpg",
                     "qrc:/resources/images/background_game5.jpg"]

        if(value === 0) {
            if(backgroundID === array[0])
                backgroundID = array[array.length - 1];
            else {
                backgroundID = array[array.indexOf(backgroundID) - 1];
            }
        }
        else {
            if(backgroundID === array[array.length - 1])
                backgroundID = array[0];
            else {
                backgroundID = array[array.indexOf(backgroundID) + 1];
            }
        }
    }

    function changingSize(value) {
        if(value === 0) {
            if(size === 60) {
                size -= 10;
                changingSizeCirclesLeftButton.visible = false;
                return;
            }
            else {
                changingSizeCirclesRightButton.visible = true;
                size -= 10;
            }
        }
        else {
            if(size === 190) {
                size += 10;
                changingSizeCirclesRightButton.visible = false;
                return;
            }
            else {
                changingSizeCirclesLeftButton.visible = true;
                size += 10;
            }
        }
    }

    Image {
        id: backgroundImage
        source: "qrc:/resources/images/background_menu.jpg"
    }

    Rectangle {
        color: Qt.rgba(15/255, 15/255, 15/255, 0.25)
        anchors.fill: parent
    }

    Item {
        id: changingSizeCircles

        Image {
            id: windowSizeImage
            x: 354
            y: 489
            source: "qrc:/resources/images/window_size.png"
        }

        Image {
            id: changingSizeCirclesLeftButton
            source: mouseAreaLeftSizeCircles.pressed ? "qrc:/resources/images/size_left_pressed.png" : "qrc:/resources/images/size_left.png"
            x: 240
            y: 531

            MouseArea {
                id: mouseAreaLeftSizeCircles
                anchors.fill: changingSizeCirclesLeftButton
                onClicked: changingSize(0)
            }
        }

        Text {
            anchors.horizontalCenter: windowSizeImage.horizontalCenter
            y: 575
            font.pixelSize: 30
            font.family: "OCR A Extended"
            font.letterSpacing: -3
            color: "white"
            text: size
        }

        Image {
            id: changingSizeCirclesRightButton
            source: mouseAreaRightSizeCircles.pressed ? "qrc:/resources/images/size_right_pressed.png" : "qrc:/resources/images/size_right.png"
            x: 697
            y: 531

            MouseArea {
                id: mouseAreaRightSizeCircles
                anchors.fill: changingSizeCirclesRightButton
                onClicked: changingSize(1)
            }
        }
    }

//    Item {
//        id: changingColorCircles

//        Text {
//            y: 150
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "Цвет кружков:"
//        }

//        Button {
//            x: 300
//            y: 150
//            text: "<"
//            onClicked: changingСolor(0)
//        }

//        Text {
//            x: 450
//            y: 150
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: colorСircles
//        }

//        Button {
//            x: 600
//            y: 150
//            text: ">"
//            onClicked: changingСolor(1)
//        }
//    }

//    Item {
//        id: changingTimerInterval

//        Text {
//            y: 300
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "Интервал:"
//        }

//        Button {
//            x: 300
//            y: 300
//            text: "<"
//            onClicked: changingInterval(0)
//        }

//        Text {
//            x: 450
//            y: 300
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: timerInterval
//        }

//        Button {
//            x: 600
//            y: 300
//            text: ">"
//            onClicked: changingInterval(1)
//        }
//    }

    Item {
        id: changingMaxCount

        Image {
            id: windowMaxImage
            x: 1264
            y: 489
            source: "qrc:/resources/images/max_window.png"
        }

        Image {
            id: windowMaxLeftButton
            source: mouseAreaMaxLeftButton.pressed ? "qrc:/resources/images/max_left_pressed.png" : "qrc:/resources/images/max_left.png"
            x: 1150
            y: 531

            MouseArea {
                id: mouseAreaMaxLeftButton
                anchors.fill: windowMaxLeftButton
                onClicked: changingMax(0)
            }
        }

        Text {
            anchors.horizontalCenter: windowMaxImage.horizontalCenter
            y: 575
            font.pixelSize: 30
            font.family: "OCR A Extended"
            font.letterSpacing: -3
            color: "white"
            text: maxCount
        }

        Image {
            id: windowMaxRightButton
            source: mouseAreaMaxRightButton.pressed ? "qrc:/resources/images/max_right_pressed.png" : "qrc:/resources/images/max_right.png"
            x: 1607
            y: 531

            MouseArea {
                id: mouseAreaMaxRightButton
                anchors.fill: windowMaxRightButton
                onClicked: changingMax(1)
            }
        }
    }

//    Item {
//        id: changingCrosshair

//        Text {
//            y: 600
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "Прицел:"
//        }

//        Button {
//            x: 300
//            y: 600
//            text: "<"
//            //onClicked:
//        }

//        Text {
//            x: 450
//            y: 600
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "В разраб..."
//        }

//        Button {
//            x: 600
//            y: 600
//            text: ">"
//            //onClicked:
//        }
//    }

//    Item {
//        id: changingBackgroundID

//        Text {
//            y: 750
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "Фон:"
//        }

//        Button {
//            x: 300
//            y: 750
//            text: "<"
//            onClicked: changingBackground(0)
//        }

//        Text {
//            x: 450
//            y: 750
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: backgroundID
//        }

//        Button {
//            x: 600
//            y: 750
//            text: ">"
//            onClicked: changingBackground(1)
//        }
//    }

//    Item {
//        id: changingSoundShots

//        Text {
//            y: 900
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "Оружие:"
//        }

//        Button {
//            x: 300
//            y: 900
//            text: "<"
//            //onClicked:
//        }

//        Text {
//            x: 450
//            y: 900
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "В разраб..."
//        }

//        Button {
//            x: 600
//            y: 900
//            text: ">"
//            //onClicked:
//        }
//    }

//    Item {
//        id: changingVolumeLevel

//        Text {
//            y: 1000
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "Громкость:"
//        }

//        Button {
//            x: 300
//            y: 1000
//            text: "<"
//            //onClicked:
//        }

//        Text {
//            x: 450
//            y: 1000
//            font.pixelSize: 30
//            font.family: "OCR A Extended"
//            font.letterSpacing: -3
//            color: "white"
//            text: "В разраб..."
//        }

//        Button {
//            x: 600
//            y: 1000
//            text: ">"
//            //onClicked:
//        }
//    }

    Image {
        id: backButton
        source: mouseAreaBackButton.pressed ? "qrc:/resources/images/back_button_pressed.png" : "qrc:/resources/images/back_button.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 930

        MouseArea {
            id: mouseAreaBackButton
            anchors.fill: backButton
            onClicked: settingsWindow.close()
        }
    }
}
