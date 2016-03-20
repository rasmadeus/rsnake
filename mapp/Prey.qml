import QtQuick 2.0

Creature {
    property alias sprite: sprite.source
    property int direction: 0
    property int step: 1

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

    Image {
        id: sprite
        anchors.fill: parent
        source: "cat.png"
    }
}
