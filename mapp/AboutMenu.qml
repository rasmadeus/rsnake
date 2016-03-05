import QtQuick 2.0

Item {
    signal gameClicked()
    signal exitClicked()

    Row {
        anchors.fill: parent

        Button {
            id: toGameActivity
            caption: qsTr("Game")
            width: parent.width / 2
            height: parent.height
        }

        Button {
            id: exit
            caption: qsTr("Exit")
            width: parent.width / 2
            height: parent.height
        }
    }

    Component.onCompleted: {
        toGameActivity.clicked.connect(gameClicked)
        exit.clicked.connect(exitClicked)
    }
}
