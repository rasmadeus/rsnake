import QtQuick 2.0

Rectangle {
    property int side: 10
    width: 10
    height: 10
    color: "#000000"

    radius: 3


    function move(xPos, yPos) {
        x = xPos
        y = yPos
    }

    function containsPrey(xPos, yPos) {
        return _containsPos(xPos, yPos) || _containsPos(xPos + 40, yPos) || _containsPos(xPos + 40, yPos + 40) || _containsPos(xPos, yPos + 40)
    }

    function _containsPos(xPos, yPos) {
        return (xPos >= x && xPos <= x + width) && (yPos >= y && yPos <= y + height)
    }

    Behavior on x {
        NumberAnimation {
            duration: 200
        }
    }
    Behavior on y {
        NumberAnimation {
            duration: 200
        }
    }
}
