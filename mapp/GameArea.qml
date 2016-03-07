import QtQuick 2.0

Rectangle {
    property var _preys: []

    function step() {
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

    function createPreys() {
        var numberOfPreys = 15

        for(var i = 0; i < numberOfPreys; ++i) {
            var component = Qt.createComponent("Prey.qml");
            if (component.status === Component.Ready) {
                _createPrey(component)
            }
        }
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
                var step = _getRandomInt(1, 5)
                var prey = component.createObject(parent, {x: xPos, y: yPos, side: preySide, step: step, sprite: preySprites[preyIndex]});
                _setDirection(prey)
                _preys.push(prey)
                break
            }
        }
    }

    Image {
        id: floor
        anchors.fill: parent
        source: "floor.png"
    }

    color: "#dddddd"
}
