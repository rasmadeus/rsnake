import QtQuick 2.0

Item {
    property alias sprite: sprite.source
    property int side: 40
    property int stepDuration: 200
    property int direction: 0
    property int step: 1

    function move(xPos, yPos) {
        x = xPos
        y = yPos
    }

    function getNextX() {
        switch(direction) {
            case 0: return x + step
            case 1: return x - step
            default: return x
        }
    }

    function getNextY() {
        switch(direction) {
            case 2: return y + step
            case 3: return y - step
            default: return y
        }
    }

    function containsPrey(xPos, yPos) {
        return _containsPos(xPos, yPos) || _containsPos(xPos + side, yPos) || _containsPos(xPos + side, yPos + side) || _containsPos(xPos, yPos + side)
    }

    function _containsPos(xPos, yPos) {
        return (xPos >= x && xPos <= x + width) && (yPos >= y && yPos <= y + height)
    }

    width: side
    height: side

    Image {
        id: sprite
        anchors.fill: parent
        source: "cat.png"
    }

    Behavior on x {
        NumberAnimation {
            duration: stepDuration
        }
    }
    Behavior on y {
        NumberAnimation {
            duration: stepDuration
        }
    }
}
