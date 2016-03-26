import QtQuick 2.0

Rectangle {
    property alias caption: caption.text
    signal clicked()

    color: "#333333"

    Text {
        id: caption
        text: qsTr("Button")
        anchors.centerIn: parent
        font.pixelSize: mouse.pressed ? parent.height / 2 : parent.height / 3
        font.bold: true
        color: mouse.pressed ? "#bbbbbb" : "#999999"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
    }

    Component.onCompleted: {
        mouse.clicked.connect(clicked)
    }
}
