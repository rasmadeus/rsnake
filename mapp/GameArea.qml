import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    property int score: 0
    signal snakeOutOfBound()
    signal allPreysWasEaten()

    function setStepDuration(value) {
        snake.setStepDuration(value)
        preys.setStepDuration(value)
    }

    function step() {
        if (!_hasSnakeInvalidPos()) {
            score += preys.muster(snake)
            snake.move()
            _checkPreysCount()
            preys.move()
        }
    }    

    function build() {
        var numberOfPreys = 25
        snake.build()
        preys.build(snake, numberOfPreys)
    }

    function kill() {
        snake.kill()
        preys.kill()
    }

    function _hasSnakeInvalidPos() {
        if (snake.eatSelf() || snake.isOutOf(x, 0, width, height)) {
            snake.killHead()
            if (snake.isDead()) {
                snakeOutOfBound()
                return true
            }
            else {
                var preysAddition = 1
                score = Math.max(0, score - 50)                
                preys.build(snake, preysAddition)
            }
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
