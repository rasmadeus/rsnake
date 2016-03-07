import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    color: "#999999"
    Text {
        anchors.fill: parent
        text: qsTr("RSnake v 1.0 <br /><a href=\"https://github.com/rasmadeus/rsnake\">Source code of this application is here</a><br />Contacts - rasmadeus@gmail.com")
        wrapMode: Text.WordWrap
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
        onLinkActivated: Qt.openUrlExternally(link)

    }
}
