import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 320
    height: 480
    title: qsTr("RSnake")

    Item {
        id: activities
        anchors.fill: parent

        GameActivity {
            property bool _isInit: false

            function _stop() {
                gameTimer.stop()
                gameActivity.kill()
                gameActivity.isPause = true
                _isInit = false
                 scoreVisible = true
            }

             id: gameActivity
             x: parent.x
             y: parent.y
             width: parent.width
             height: parent.height                

             onStartClicked: {
                if (!_isInit) {
                    gameActivity.build()
                    gameActivity.setStepDuration(gameTimer.interval)
                    _isInit = true
                    gameActivity.score = 0
                }
                if (gameActivity.isPause) {
                    gameTimer.stop()
                    scoreVisible = true
                }
                else {
                    gameTimer.start()
                    scoreVisible = false
                }
             }

             onStopClicked: {                 
                _stop()
             }

             onAboutClicked: {
                 gameActivity.isPause = true
                 gameTimer.stop()
                 scoreVisible = true
                 activities.state = "aboutActivity"
             }

             onExitClicked: {
                 Qt.quit()
             }

             onSnakeOutOfBound: {
                _stop()
             }
        }

        AboutActivity {
            id: aboutActivity
            x: parent.x
            y: parent.x - parent.height
            width: parent.width
            height: parent.height


            onGameClicked: {
                activities.state = ""
            }

            onExitClicked: {
                Qt.quit()
            }
        }

        states: [
            State {
                name: "aboutActivity"
                 PropertyChanges {
                     target: aboutActivity
                     y: activities.y
                 }
                 PropertyChanges {
                     target: gameActivity
                     y: activities.height
                 }
            }
        ]

        transitions: [
            Transition {
                 NumberAnimation {
                     properties: "y"
                     duration: 3000
                     easing.type: Easing.InOutBack
                 }
            }
        ]
    }

    Timer {
        id: gameTimer
        interval: 200
        repeat: true
        running: false
        onTriggered: gameActivity.step()
    }
}
