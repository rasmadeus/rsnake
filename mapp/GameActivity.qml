import QtQuick 2.0

Item {
    property alias isPause: menu.isPause
    property alias scoreVisible: score.visible
    property alias score: gameArea.score
    property int level: 1

    signal allPreysWasEaten()
    signal snakeOutOfBound()
    signal startClicked()
    signal stopClicked()
    signal aboutClicked()
    signal exitClicked()

    function step() {
        gameArea.step()
    }

    function build() {
        gameArea.build()
    }

    function kill() {
        gameArea.kill()
    }

    function setStepDuration(value) {
        gameArea.setStepDuration(value)
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
    Text {
        id: levelText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: score.bottom
        text: qsTr("Level №%1").arg(level)
        font.bold: true
        font.pointSize: 15
        color: "#222222"
        z: 1
        visible: scoreVisible
    }

    Component.onCompleted: {
        menu.startClicked.connect(startClicked)
        menu.stopClicked.connect(stopClicked)
        menu.aboutClicked.connect(aboutClicked)
        menu.exitClicked.connect(exitClicked)
        gameArea.snakeOutOfBound.connect(snakeOutOfBound)
        gameArea.allPreysWasEaten.connect(allPreysWasEaten)
    }
}
