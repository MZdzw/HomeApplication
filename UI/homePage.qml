import QtQuick 2.15
import QtQuick.Controls 2.15


Item
{
    Rectangle
    {
        id: rectangle
        color: "#232f4f"
        anchors.fill: parent

        Label
        {
            id: label
            color: "#ffffff"
            text: qsTr("Home")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 14
        }
    }
}
