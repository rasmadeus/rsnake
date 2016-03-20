import QtQuick 2.0

Rectangle {
    property int score: 0
    signal snakeOutOfBound()

    function setStepDuration(value) {
        snake.setStepDuration(value)
        preys.setStepDuration(value)
    }

    function step() {
        snake.move()
        _checkSnakePos()
        score += preys.muster(snake)
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

    function _checkSnakePos() {
        if (snake.eatSelf() || snake.isOutOf(x, y, width, height)) {
            snakeOutOfBound()
        }
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
