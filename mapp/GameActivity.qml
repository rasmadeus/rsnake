import QtQuick 2.0

Item {
    property alias isPause: menu.isPause

    signal startClicked()
    signal stopClicked()
    signal aboutClicked()
    signal exitClicked()

    function step() {
        gameArea.step()
    }

    function createPreys() {
        gameArea.createPreys()
    }

    function destroyPreys() {
        gameArea.destroyPreys()
    }

    MainMenu {
        id: menu

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        height: 40
    }

    GameArea {
        id: gameArea

        anchors.top: menu.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }

    Component.onCompleted: {
        menu.startClicked.connect(startClicked)
        menu.stopClicked.connect(stopClicked)
        menu.aboutClicked.connect(aboutClicked)
        menu.exitClicked.connect(exitClicked)
    }
}
