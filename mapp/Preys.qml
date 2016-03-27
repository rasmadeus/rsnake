import QtQuick 2.0

Item {
    property var _preys: []

    function isEmpty() {
        return _preys.length === 0
    }

    function setStepDuration(value) {
        for (var i = 0; i < _preys.length; ++i) {
            _preys[i].stepDuration = value
        }
    }

    function muster(snake) {
        var score = 0
        for(var i = 0; i < _preys.length; ++i) {
            if (snake.contains(_preys[i].x, _preys[i].y, _preys[i].width, _preys[i].height)) {
                score += _preys[i].step
                snake.grow()
                _preys[i].destroy()
                _preys.splice(i, 1)
            }
        }
        return score
    }

    function move() {
        for(var i = 0; i < _preys.length; ++i) {
            var xPos = _preys[i].getNextX()
            var yPos = _preys[i].getNextY()
            var changeDirection = false

            if (xPos > width - _preys[i].width) {
                xPos = width - _preys[i].width
                changeDirection = true
            }
            else if (xPos < x) {
                xPos = x
                changeDirection = true
            }
            else if (yPos > height - _preys[i].height) {
                yPos = height - _preys[i].height
                changeDirection = true
            }
            else if (yPos < y) {
                yPos = y
                changeDirection = true
            }

            if (!_contains(xPos, yPos, _preys[i].width, _preys[i].height, i) && !snake.contains(xPos, yPos, _preys[i].width, _preys[i].height)) {
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

    function build(snake, numberOfPreys) {
        for(var i = 0; i < numberOfPreys; ++i) {
            var component = Qt.createComponent("Prey.qml")
            if (component.status === Component.Ready) {
                _buildPrey(component, snake)
            }
        }
    }

    function kill() {
        for(var i = 0; i < _preys.length; ++i) {
            _preys[i].destroy()
        }
        _preys = []
    }

    function _contains(x, y, width, height, indexExclude) {
        for(var i = 0; i < _preys.length; ++i) {
            if (i === indexExclude) {
                continue
            }
            if (_preys[i].contains(x, y, width, height)) {
                return true
            }
        }
        return false
    }

    function _setDirection(prey) {
        prey.direction = _getRandomInt(0, 4)
    }

    function _getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }

    function _buildPrey(component, snake) {
        var preySprites = ["bear.png", "butterfly.png", "cat.png", "dog.png", "rabbit.png"]
        var preySide = parent.height / 10
        var numberOfAttempts = 5

        for(var i = 0; i < numberOfAttempts; ++i) {
            var xPos = _getRandomInt(x, x + width - preySide)
            var yPos = _getRandomInt(y, y + height - preySide)
            var direction = _getRandomInt(0, 4)
            var velocityMin = 4
            var velocityMax = 30
            if (!_contains(xPos, yPos, preySide, preySide) && !snake.contains(xPos, yPos, preySide, preySide)) {
                var preyIndex = _getRandomInt(0, preySprites.length)
                var step = _getRandomInt(velocityMin, velocityMax)
                var prey = component.createObject(parent, {x: xPos, y: yPos, z: 0, width: preySide, height: preySide, step: step, sprite: preySprites[preyIndex]});
                _setDirection(prey)
                _preys.push(prey)
                break
            }
            if (i === numberOfAttempts - 1) {
                component.destroy()
            }
        }
    }
}
