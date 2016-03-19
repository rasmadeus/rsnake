import QtQuick 2.0

Rectangle {
    property int score: 0
    property var _preys: []

    function setStepDuration(value) {
        snake.setStepDuration(value)
        preys.setStepDuration(value)
    }

    function step() {
        snake.move()
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
        onClicked: {
            var snakeX = snake.head().x
            var snakeY = snake.head().y
            switch(snake.direction) {
                case 0:
                case 2: snake.direction = mouse.x < snakeX ? 3 : 1; break;
                case 1:
                case 3: snake.direction = mouse.y < snakeY ? 0 : 2; break;
            }
        }
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
