import QtQuick 2.0

Rectangle {
    property int score: 0

    function setStepDuration(value) {
        snake.setStepDuration(value)
        preys.setStepDuration(value)
    }

    function step() {
        snake.move()
        preys.muster(snake)
        preys.move()
    }

    function build() {
        snake.build()
        preys.build(snake)
    }

    function kill() {
        snake.kill()
        preys.kill()
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: snake.changeDirection(mouse)
    }

    Image {
        id: floor
        anchors.fill: parent
        source: "floor.png"
    }

    Snake {
        id: snake
        anchors.fill: parent
    }

    Preys {
        id: preys
        anchors.fill: parent
    }
}
