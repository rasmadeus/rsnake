import QtQuick 2.0

Item {
    property alias isPause: menu.isPause
    property alias scoreVisible: score.visible

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

    function createSnake() {
        gameArea.createSnake()
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

    Text {
        id: score
        anchors.centerIn: parent
        text: qsTr("Your score: %1").arg(gameArea.score)
        font.bold: true
        font.pointSize: 20
        color: "#222222"
        z: 1
    }

    Component.onCompleted: {
        menu.startClicked.connect(startClicked)
        menu.stopClicked.connect(stopClicked)
        menu.aboutClicked.connect(aboutClicked)
        menu.exitClicked.connect(exitClicked)
    }
}
