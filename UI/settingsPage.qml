import QtQuick 2.15
import QtQuick.Controls 2.15
import "MyComponents"

Item {
    Rectangle {
        id: rectangle
        color: "#232f4f"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        InSettingsButton
        {
            id: openSerialButton
            text: qsTr("Open")
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 20
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            onClicked:
            {
                serial.openSerialPort()
            }
        }

        InSettingsButton
        {
            id: closeSerialButton
            text: qsTr("Close")
            anchors.top: openSerialButton.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: 10
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            onClicked:
            {
                serial.closeSerialPort()
            }
        }

        InSettingsComboBox
        {
            id: dataBitsComboBox
            width: 140
            height: 30
            anchors.left: parent.left
            anchors.top: baudRate.bottom
            anchors.topMargin: 20
            anchors.leftMargin: 20

        }

        InSettingsBaudRate
        {
            id: baudRate
            anchors
            {
                top: closeSerialButton.bottom
                topMargin: 20
                left: parent.left
                leftMargin: 20
            }

        }
    }
}
