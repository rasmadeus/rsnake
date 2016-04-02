import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    property string _colorText: "#333333"
    property string _allocatedText: "#000000"

    Image {
        anchors.fill: parent
        source: "hay.png"
    }

    Column {
        anchors.centerIn: parent
        width: parent.width

        Text {
            id: version
            width: parent.width
            text: qsTr("RSnake version 1.0")
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: parent.width / 20
            color: _colorText
        }

        Text {
            id: contacts
            width: parent.width
            text: qsTr("Author's contact: rasmadeus@gmail.com")
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: parent.width / 20
            color: _colorText
        }

        Text {
            id: sourceCodeLink
            width: parent.width
            text: qsTr("Source code of this application is here")
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: parent.width / 30
            color: mouse.containsMouse ? _allocatedText : _colorText

            MouseArea {
                id: mouse
                anchors.fill: parent
                hoverEnabled: true
                onClicked: Qt.openUrlExternally("https://github.com/rasmadeus/rsnake")
            }
        }
    }
}
