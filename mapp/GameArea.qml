import QtQuick 2.0

Rectangle {
    property int score: 0
    signal snakeOutOfBound()
    signal allPreysWasEaten()

    function setStepDuration(value) {
        snake.setStepDuration(value)
        preys.setStepDuration(value)
    }

    function step() {
        snake.move()
        if (_hasSnakeInvalidPos()) {
            return
        }
        score += preys.muster(snake)
        _checkPreysCount()
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

    function _hasSnakeInvalidPos() {
        if (snake.eatSelf() || snake.isOutOf(x, y, width, height)) {
            snakeOutOfBound()
            return true
        }
        return false
    }

    function _checkPreysCount() {
        if (preys.isEmpty()) {
            allPreysWasEaten()
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
