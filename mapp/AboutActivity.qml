import QtQuick 2.0

Item {
    signal gameClicked()
    signal exitClicked()

    AboutMenu {
        id: menu

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        height: 40
    }

    AboutArea {
        id: aboutArea

        anchors.top: menu.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    Component.onCompleted: {
        menu.gameClicked.connect(gameClicked)
        menu.exitClicked.connect(exitClicked)
    }
}
