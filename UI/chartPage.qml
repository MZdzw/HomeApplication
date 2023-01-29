import QtQuick 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15

Item
{
    Rectangle
    {
        id: chartBg
        color: "#232f4f"
        anchors.fill: parent

        ChartView
        {
            id: line
            anchors.fill: parent
            legend.visible: false
            antialiasing: true

            ValuesAxis
            {
                id: axisX
                min: 0
                max: 10
                tickCount: 5
            }

            ValuesAxis
            {
                id: axisY
                min: 0
                max: 255
            }

            LineSeries
            {
                id: series
                axisX: axisX
                axisY: axisY

            }
            // Add data dynamically to the series
            Timer
            {
                property int amountOfData: 0 //So we know when we need to start
                id: refreshTimer
                interval: 10
                running: true
                repeat: true
                onTriggered:
                {
                    series.append(amountOfData, parseInt(serialPortData.text));

                    if(amountOfData > axisX.max)
                    {
                        axisX.min++;
                        axisX.max++;
                    }
                    else
                    {
                        amountOfData++; //This else is just to stop incrementing the variable unnecessarily
                    }
                }
            }
        }
    }
}
