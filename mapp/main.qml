import QtQuick 2.3
import QtQuick.Controls 1.2

ApplicationWindow {
    visible: true
    width: 320
    height: 480
    title: qsTr("RSnake")

    AboutActivity {
        id: aboutActivity
        anchors.fill: parent

        onGameClicked: {
            z = 0
            gameActivity.z = 1
        }

        onExitClicked: {
            Qt.quit()
        }
    }

    GameActivity {
         id: gameActivity
         anchors.fill: parent

         onStartClicked: {

         }

         onStopClicked: {

         }

         onAboutClicked: {
             z = 0
             aboutActivity.z = 1
         }

         onExitClicked: {
             Qt.quit()
         }
    }
}
