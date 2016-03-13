import QtQuick 2.0

Rectangle {
    property int score: 0
    property var _preys: []
    property var _snake: []
    property int _snakeDirection: 2

    function step() {
       // moveSnake()
        findPreys()
        movePreys()
    }

    function findPreys() {

    }


    function movePreys() {
        for(var i = 0; i < _preys.length; ++i) {
            var xPos = _preys[i].getNextX()
            var yPos = _preys[i].getNextY()
            var changeDirection = false

            if (xPos > width - _preys[i].side) {
                xPos = width - _preys[i].side
                changeDirection = true
            }
            else if (xPos < x) {
                xPos = x
                changeDirection = true
            }
            else if (yPos > height) {
                yPos = height
                changeDirection = true
            }
            else if (yPos < y) {
                yPos = y
                changeDirection = true
            }

            if (_isPosFree(xPos, yPos, i)) {
                _preys[i].move(xPos, yPos)
            }
            else {
                changeDirection = true
            }

            if (changeDirection) {
                _setDirection(_preys[i])
            }
        }
    }

    function moveSnake() {
        switch(_snakeDirection) {
            case 0: _moveUp(); break;
            case 1: _moveRight(); break;
            case 2: _moveDown(); break;
            case 3: _moveLeft(); break;
        }
    }

    function _moveUp() {
        for(var i = 0; i < _snake.length - 1; ++i) {
            _snake[i].move(_snake[i + 1].x, _snake[i + 1].y)
        }
        _snake[_snake.length - 1].move(_snake[_snake.length - 1].x, _snake[_snake.length - 1].y - _snake[_snake.length - 1].height);
    }

    function _moveRight() {
        for(var i = 0; i < _snake.length - 1; ++i) {
            _snake[i].move(_snake[i + 1].x, _snake[i + 1].y)
        }
        _snake[_snake.length - 1].move(_snake[_snake.length - 1].x + _snake[_snake.length - 1].width, _snake[_snake.length - 1].y);
    }

    function _moveDown() {
        for(var i = 0; i < _snake.length - 1; ++i) {
            _snake[i].move(_snake[i + 1].x, _snake[i + 1].y)
        }
        _snake[_snake.length - 1].move(_snake[_snake.length - 1].x, _snake[_snake.length - 1].y + _snake[_snake.length - 1].height);
    }

    function _moveLeft() {
        for(var i = 0; i < _snake.length - 1; ++i) {
            _snake[i].move(_snake[i + 1].x, _snake[i + 1].y)
        }
        _snake[_snake.length - 1].move(_snake[_snake.length - 1].x - _snake[_snake.length - 1].width, _snake[_snake.length - 1].y);
    }

    function createPreys() {
        var numberOfPreys = 15
        for(var i = 0; i < numberOfPreys; ++i) {
            var component = Qt.createComponent("Prey.qml")
            if (component.status === Component.Ready) {
                _createPrey(component)
            }
        }
    }

    function createSnake() {
        var snakeLength = 5
        var xPos = (parent.width - parent.x - 5) / 2
        var yPos = y
        for(var i = 0; i < snakeLength; ++i) {
            var component = Qt.createComponent("SnakePart.qml")
            if (component.status === Component.Ready) {
                var snakePart = component.createObject(parent, {x: xPos, y: yPos});
                yPos += 10
                _snake.push(snakePart)
            }
        }
        _snakeDirection = 2
    }


    function destroyPreys() {
        for(var i = 0; i < _preys.length; ++i) {
            _preys[i].destroy()
        }
        _preys = []

        for(i = 0; i < _snake.length; ++i) {
            _snake[i].destroy()
        }
        _snake = []
    }

    function _isPosFree(xPos, yPos, indexExclude) {
        for(var i = 0; i < _preys.length; ++i) {
            if (i === indexExclude) {
                continue
            }
            if (_preys[i].containsPrey(xPos, yPos)) {
                return false
            }
        }
        for(i = 0; i < _snake.length; ++i) {
            if (_snake[i].containsPrey(xPos, yPos)) {
                return false
            }
        }

        return true
    }

    function _setDirection(prey) {
        prey.direction = _getRandomInt(0, 4)
    }

    function _getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }

    function _preysContain(xPos, yPos) {
        for(var i = 0; i < _preys.length; ++i) {
            if (_preys[i].containsPrey(xPos, yPos))
                return true
        }
        return false
    }

    function _createPrey(component) {
        var preySprites = ["bear.png", "butterfly.png", "cat.png", "dog.png", "rabbit.png"]

        var preySide = 40
        while(true) {
            var xPos = _getRandomInt(x, x + width - preySide)
            var yPos = _getRandomInt(y, y + height - preySide)
            var direction = _getRandomInt(0, 4)
            if (!_preysContain(xPos, yPos)) {
                var preyIndex = _getRandomInt(0, preySprites.length)
                var step = _getRandomInt(4, 10)
                var prey = component.createObject(parent, {x: xPos, y: yPos, z: 0, side: preySide, step: step, sprite: preySprites[preyIndex]});
                _setDirection(prey)
                _preys.push(prey)
                break
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: {
            switch(_snakeDirection) {
                case 0: _snakeDirection = mouse.x < _snake[_snake.length -1].x ? 3 : 1; break;
                case 1: _snakeDirection = mouse.y < _snake[_snake.length -1].y ? 0 : 2; break;
                case 2: _snakeDirection = mouse.x < _snake[_snake.length -1].x ? 3 : 1; break;
                case 3: _snakeDirection = mouse.y < _snake[_snake.length -1].y ? 0 : 2; break;
            }
        }
    }

    Image {
        id: floor
        anchors.fill: parent
        source: "floor.png"
    }
}
