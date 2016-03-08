import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    property string _colorText: "#333333"
    property string _allocatedText: "#000000"

    Image {
        anchors.fill: parent
        source: "hay.png"
    }

    Text {
        id: version
        text: qsTr("RSnake version 1.0")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
        anchors.bottom: contacts.top
        anchors.horizontalCenter: parent.horizontalCenter
        color: _colorText
    }

    Text {
        id: contacts
        text: qsTr("Contacts: rasmadeus@gmail.com")
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
        anchors.centerIn: parent
        color: _colorText
    }

    Text {
        id: sourceCodeLink
        text: qsTr("Source code of this application is here")
        font.bold: true
        font.pixelSize: 15
        color: mouse.containsMouse ? _allocatedText : _colorText
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
