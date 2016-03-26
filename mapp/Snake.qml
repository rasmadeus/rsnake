import QtQuick 2.0

Item {
    property int _direction: 2
    property var _body: []
    property int _xTail: 0
    property int _yTail: 0
    property int _stepDuration: 100

    function head() {
        return _body[_body.length - 1]
    }

    function changeDirection(mouse) {
        if (!_body.length) {
            return
        }

        var headPart = head()
        var headX = headPart.x
        var headY = headPart.y
        switch(_direction) {
            case 0:
            case 2: _direction = mouse.x < headX ? 3 : 1; break;
            case 1:
            case 3: _direction = mouse.y < headY ? 0 : 2; break;
        }
    }

    function setStepDuration(value) {
        _stepDuration = value
        for(var i = 0; i < _body.length; ++i) {
            _body[i].stepDuration = value
        }
    }

    function contains(x, y, width, height) {
        for(var i = 0; i < _body.length; ++i) {
            if (_body[i].contains(x, y, width, height)) {
                return true
            }
        }
        return false
    }

    function kill() {
        for(var i = 0; i < _body.length; ++i) {
            _body[i].destroy()
        }
        _body = []
    }

    function killHead() {
        head().destroy()
        _body.splice(_body.length - 1, 1)
    }

    function isDead() {
        return _body.length < 3
    }

    function isOutOf(x, y, width, height) {
        var snakeHead = head()
        return snakeHead.x < x || snakeHead.x + snakeHead.width > width || snakeHead.y < y || snakeHead.y + snakeHead.height > height
    }

    function eatSelf() {
        var snakeHead = head()
        var isAbletoEatPart = 3
        for(var i = 0; i < _body.length - isAbletoEatPart; ++i) {
            if (_body[i].contains(snakeHead.x, snakeHead.y, snakeHead.width, snakeHead.height)) {
                return true
            }
        }
        return false
    }

    function build() {
        var snakeSize = parent.height / 20
        var snakeLength = 5
        var xPos = (parent.width - parent.x - 5) / 2
        var yPos = y
        for(var i = 0; i < snakeLength; ++i) {
            var component = Qt.createComponent("SnakePart.qml")
            if (component.status === Component.Ready) {
                var snakePart = component.createObject(parent, {x: xPos, y: yPos, width: snakeSize, height: snakeSize});
                yPos += snakeSize
                _body.push(snakePart)
            }
        }
        _direction = 2
    }

    function grow() {
        var snakeSize = parent.height / 20
        var component = Qt.createComponent("SnakePart.qml")
        if (component.status === Component.Ready) {
            var snakePart = component.createObject(parent, {x: _xTail, y: _yTail, width: snakeSize, height: snakeSize, stepDuration: _stepDuration});
            _body.unshift(snakePart)
        }
    }

    function move() {
        switch(_direction) {
            case 0: _moveUp(); break;
            case 1: _moveRight(); break;
            case 2: _moveDown(); break;
            case 3: _moveLeft(); break;
        }
        _xTail = _body[0].x
        _yTail = _body[0].y
    }

    function _moveUp() {
        for(var i = 0; i < _body.length - 1; ++i) {
            _body[i].move(_body[i + 1].x, _body[i + 1].y)
        }
        _body[_body.length - 1].move(_body[_body.length - 1].x, _body[_body.length - 1].y - _body[_body.length - 1].height);
    }

    function _moveRight() {
        for(var i = 0; i < _body.length - 1; ++i) {
            _body[i].move(_body[i + 1].x, _body[i + 1].y)
        }
        _body[_body.length - 1].move(_body[_body.length - 1].x + _body[_body.length - 1].width, _body[_body.length - 1].y);
    }

    function _moveDown() {
        for(var i = 0; i < _body.length - 1; ++i) {
            _body[i].move(_body[i + 1].x, _body[i + 1].y)
        }
        _body[_body.length - 1].move(_body[_body.length - 1].x, _body[_body.length - 1].y + _body[_body.length - 1].height);
    }

    function _moveLeft() {
        for(var i = 0; i < _body.length - 1; ++i) {
            _body[i].move(_body[i + 1].x, _body[i + 1].y)
        }
        _body[_body.length - 1].move(_body[_body.length - 1].x - _body[_body.length - 1].width, _body[_body.length - 1].y);
    }
}
