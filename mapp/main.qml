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
             id: gameActivity
             x: parent.x
             y: parent.y
             width: parent.width
             height: parent.height

             onStartClicked: {

             }

             onStopClicked: {

             }

             onAboutClicked: {
                 activities.state = "aboutActivity"
             }

             onExitClicked: {
                 Qt.quit()
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
}
