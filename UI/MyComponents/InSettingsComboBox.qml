import QtQuick 2.15
import QtQuick.Controls 2.15

ComboBox
{
    id: inSettingsCB
    width: 140
    height: 30

    currentIndex: 3
    displayText: "DataBits: " + currentText
    flat: true
    QtObject
    {
        id: inSettingsDynamicColor
        property var dynamicColor:
            if(inSettingsCB.down)
            {
                   inSettingsCB.down ? "#00a1f1" : "#f00d82"
            }
            else
            {
                   inSettingsCB.hovered ? "#eeb02b" : "#f00d82"
            }

    }

    model: ["5", "6", "7", "8"]

    background: Rectangle
    {
        color: inSettingsDynamicColor.dynamicColor
        implicitWidth: 100
        implicitHeight: 40
        border.color: "#26282a"
        radius: 5
    }
    delegate: ItemDelegate
    {
        id:itemDlgt
        width: inSettingsCB.width
        height:40
        padding:0

        contentItem: Text
        {
            id:textItem
            text: modelData
            color: "black"
            font: inSettingsCB.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            leftPadding: 20
        }
        background: Rectangle
        {
            radius: 20
            color:itemDlgt.hovered ? "#00a1f1" : "transparent"
            anchors.left: itemDlgt.left
            anchors.leftMargin: 0
            width:itemDlgt.width-2
        }
    }
    popup: Popup
    {
        id:comboPopup
        y: inSettingsCB.height - 1
        width: inSettingsCB.width
        height:contentItem.implicitHeight
        padding: 1
        clip: true

        contentItem: ListView
        {
            id:listView
            implicitHeight: contentHeight/2
            model: inSettingsCB.popup.visible ? inSettingsCB.delegateModel : null
        }

        background: Rectangle
        {
            radius: 20
            border.width: 1
            border.color:"#f00d82"
            color: "#f00d82"
        }
    }
}
