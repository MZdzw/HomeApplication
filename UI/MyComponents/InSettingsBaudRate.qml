import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle
{
    width: 450
    height: 110
    color: "transparent"
    Slider
    {
        id: baudRateSlider
        width: parent.width
        height: 60
        property color strapColor: Qt.rgba(1, 0, 0.0, 1)
        stepSize: 1
        to: 7
        value: 7

        property bool showValue: true


        background: Rectangle
        {
            x: baudRateSlider.leftPadding ;
            y: baudRateSlider.topPadding + (baudRateSlider.availableHeight / 2 - height / 2)

            width: baudRateSlider.availableWidth
            height: 5
            radius: 2

            color: baudRateSlider.strapColor
        }

        handle: Rectangle
        {
            id: sliderHandle
            x: baudRateSlider.leftPadding  + baudRateSlider.visualPosition * (baudRateSlider.availableWidth- width)
            y: baudRateSlider.topPadding + baudRateSlider.availableHeight / 2 - height / 2

            height: baudRateSlider.height/2
            width: baudRateSlider.height/2

            radius: width/2
            color: "#f00d82"

            border
            {
                width: baudRateSlider.pressed ? width/2 : 1
                color: baudRateSlider.pressed ? "#00a1f1" : "#f00d82"

                Behavior on width
                {
                    NumberAnimation
                    {
                        duration: 200;
                    }
                }
            }
        }
        onValueChanged:
            {
                if(baudRateSlider.value === 0)
                {
                    baudRateProgressBar.value = 1200
                    baudRateSlider.strapColor = Qt.rgba(0, 0, 1, 1)
                    serial.setBaudRate(baudRateProgressBar.value)
                }
                else if(baudRateSlider.value === 1)
                {
                    baudRateProgressBar.value = 2400
                    baudRateSlider.strapColor = Qt.rgba(0.1, 0, 0.9, 1)
                    serial.setBaudRate(baudRateProgressBar.value)
                }
                else if(baudRateSlider.value === 2)
                {
                    baudRateProgressBar.value = 4800
                    baudRateSlider.strapColor = Qt.rgba(0.2, 0, 0.8, 1)
                    serial.setBaudRate(baudRateProgressBar.value)
                }
                else if(baudRateSlider.value === 3)
                {
                    baudRateProgressBar.value = 9600
                    baudRateSlider.strapColor = Qt.rgba(0.3, 0, 0.7, 1)
                    serial.setBaudRate(baudRateProgressBar.value)
                }
                else if(baudRateSlider.value === 4)
                {
                    baudRateProgressBar.value = 19200
                    baudRateSlider.strapColor = Qt.rgba(0.4, 0, 0.6, 1)
                    serial.setBaudRate(baudRateProgressBar.value)
                }
                else if(baudRateSlider.value === 5)
                {
                    baudRateProgressBar.value = 38400
                    baudRateSlider.strapColor = Qt.rgba(0.6, 0, 0.4, 1)
                    serial.setBaudRate(baudRateProgressBar.value)
                }
                else if(baudRateSlider.value === 6)
                {
                    baudRateProgressBar.value = 57600
                    baudRateSlider.strapColor = Qt.rgba(0.8, 0, 0.2, 1)
                    serial.setBaudRate(baudRateProgressBar.value)
                }
                else if(baudRateSlider.value === 7)
                {
                    baudRateProgressBar.value = 115200
                    baudRateSlider.strapColor = Qt.rgba(1, 0, 0, 1)
                    serial.setBaudRate(baudRateProgressBar.value)
                }
            }
    }

    ProgressBar
    {
        id: baudRateProgressBar

        anchors.top: baudRateSlider.bottom
        anchors.topMargin: 10
        width: parent.width
        height: parent.height - anchors.topMargin - baudRateSlider.height
        to: 115200
        value: 115200



        background: Rectangle
        {
            implicitWidth: 450
            implicitHeight: 26
            color: "#e6e6e6"
            radius: 3
        }
        contentItem: Item {
            implicitWidth: 200
            implicitHeight: 4

            Rectangle {
                width: baudRateProgressBar.visualPosition * parent.width
                height: parent.height
                radius: 2
                color: baudRateSlider.strapColor

                Text {
                    id: baudRateProgressBarText
                    anchors
                    {
                        left: parent.left
                        leftMargin: baudRateProgressBar.width/2 - 30
                        verticalCenter: parent.verticalCenter
                        //horizontalCenter: baudRateProgressBar.horizontalCenter
                    }
                    font.pointSize: 14

                    text: Number(baudRateProgressBar.value)
                }
            }
        }
    }
}
