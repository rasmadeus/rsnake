import QtQuick 2.0

Rectangle {
    color: "transparent"

    property int stepDuration: 100

    function contains(x2, y2, width2, height2) {
        return _contains(x, x2, width, width2) && _contains(y, y2, height, height2)
    }

    function _line_contains_coord(x1, length1, x2) {
        return x2 - x1 <= length1
    }

    function _contains(begin1, begin2, length1, length2) {
        return begin1 > begin2 ? _line_contains_coord(begin2, length2, begin1) : _line_contains_coord(begin1, length1, begin2)
    }

    function move(xPos, yPos) {
        x = xPos
        y = yPos
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
