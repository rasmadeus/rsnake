import QtQuick 2.0

Item {
    property int direction: 2
    property var _body: []

    function setStepDuration(value) {
        for(var i = 0; i < _body.length; ++i) {
            _body[i].stepDuration = value
        }
    }

    function head() {
        return _body[_body.length - 1]
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

    function build() {
        var snakeSize = 15
        var snakeLength = 5
        var xPos = (parent.width - parent.x - 5) / 2
        var yPos = y
        for(var i = 0; i < snakeLength; ++i) {
            var component = Qt.createComponent("SnakePart.qml")
            if (component.status === Component.Ready) {
                var snakePart = component.createObject(parent, {x: xPos, y: yPos});
                yPos += snakeSize
                _body.push(snakePart)
            }
        }
        direction = 2
    }

    function move() {
        switch(direction) {
            case 0: _moveUp(); break;
            case 1: _moveRight(); break;
            case 2: _moveDown(); break;
            case 3: _moveLeft(); break;
        }
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
