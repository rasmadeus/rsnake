import QtQuick 2.0

Item {
    signal startClicked()
    signal stopClicked()
    signal aboutClicked()
    signal exitClicked()

    Row {
        anchors.fill: parent

        Button {
            id: startPause
            caption: qsTr("Start")
            width: parent.width / 4
            height: parent.height
        }
        Button {
            id: stop
            caption: qsTr("Stop")
            width: parent.width / 4
            height: parent.height
        }
        Button {
            id: about
            caption: qsTr("About")
            width: parent.width / 4
            height: parent.height
        }
        Button {
            id: exit
            caption: qsTr("Exit")
            width: parent.width / 4
            height: parent.height
        }
    }

    Component.onCompleted: {
        startPause.clicked.connect(startClicked)
        stop.clicked.connect(stopClicked)
        about.clicked.connect(aboutClicked)
        exit.clicked.connect(exitClicked)
    }
}
