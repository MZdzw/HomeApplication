import QtQuick 2.15
import QtQuick.Controls 2.15

Button
{
    id: inSettingsBtn
    height: 30
    text: qsTr("InSettingsButton")

    QtObject
    {
        id: inSettingsDynamicColor
        property var dynamicColor:
            if(inSettingsBtn.down)
            {
                   inSettingsBtn.down ? "#00a1f1" : "#f00d82"
            }
            else
            {
                   inSettingsBtn.hovered ? "#eeb02b" : "#f00d82"
            }

    }
    background: Rectangle
    {
        color: inSettingsDynamicColor.dynamicColor
        implicitWidth: 100
        implicitHeight: 40
        border.color: "#26282a"
        radius: 5
    }
}
