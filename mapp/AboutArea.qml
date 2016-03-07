import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    color: "#999999"

    Text {
        id: version
        text: qsTr("RSnake version 1.0")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: contacts
        text: qsTr("Contacts: rasmadeus@gmail.com")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
        anchors.top: version.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: sourceCodeLink
        text: qsTr("Source code of this application is here")
        font.bold: true
        font.pixelSize: 15
        color: mouse.containsMouse ? "#aa0000" : "#0000aa"
        anchors.top: contacts.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true
            onClicked: Qt.openUrlExternally("https://github.com/rasmadeus/rsnake")
        }
    }
}
