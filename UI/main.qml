import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "MyComponents"


Window {
    id: mainWindow
    width: 1000
    height: 580
    visible: true
    title: qsTr("Home Application")


    Rectangle {
        id: bg
        x: 422
        y: 167
        color: "#363f54"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.leftMargin: 10

        Rectangle {
            id: appContainer
            color: "#233254"
            border.color: "#47536b"
            border.width: 1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#0f1627"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton
                {
                    id: toggleBtn
                    width: 60
                    height: 60

                    onClicked: animationMenu.running = true
                }

                Rectangle
                {
                    id: appActions
                    color: "#1c1d20"
                    anchors.right: parent.right
                    anchors.left: toggleBtn.right
                    anchors.top: parent.top
                    anchors.bottom: serialPortMsg.top

                    Text
                    {
                        id: timeText
                        text: Qt.formatTime(new Date(),"hh:mm")
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                Rectangle
                {
                    id: serialPortMsg
                    height: parent.height/2
                    color: "#b9393c43"
                    anchors.right: parent.right
                    anchors.left: toggleBtn.right
                    anchors.bottom: parent.bottom
                    Text
                    {
                        id: serialPortData
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        color: "white"
                        text: "Hello"

                        Connections
                        {
                            target: serial

                            function onIsMsgRcvChanged(data1)
                            {
                                serialPortData.text = data1
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: content
                color: "#232f4f"
                anchors.left: sideBar.right
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                clip: true
                anchors.leftMargin: 0
                anchors.topMargin: 0

                StackView
                {
                    id: stackView
                    anchors.fill: parent
                    initialItem: Qt.resolvedUrl("qrc:/UI/homePage.qml");
                }
            }

            Rectangle {
                id: sideBar
                y: 77
                width: 60
                color: "#0f1627"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 60
                clip: true

                PropertyAnimation
                {
                    id: animationMenu
                    target: sideBar
                    property: "width"
                    to: if(sideBar.width === 60) return 200; else return 60
                    duration: 200
                    easing.type: Easing.InOutQuint

                }

                SideButton
                {
                    id: homeBtn
                    btnIconSource: "../Assets/home.png"
                    width: sideBar.width
                    text: qsTr("Home")
                    isActiveMenu: true
                    icon.color: "#ffffff"

                    onClicked:
                    {
                        homeBtn.isActiveMenu = true
                        chartBtn.isActiveMenu = false
                        settingsBtn.isActiveMenu = false
                        stackView.push(Qt.resolvedUrl("qrc:/UI/homePage.qml"))

                    }
                }

                SideButton
                {
                    id : settingsBtn
                    btnIconSource: "../Assets/settings.png"
                    text: qsTr("Settings")

                    width: sideBar.width
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    isActiveMenu: false

                    onClicked:
                    {
                        homeBtn.isActiveMenu = false
                        chartBtn.isActiveMenu = false
                        settingsBtn.isActiveMenu = true
                        stackView.push(Qt.resolvedUrl("qrc:/UI/settingsPage.qml"))
                    }
                }

                SideButton
                {
                    id: chartBtn
                    btnIconSource: "../Assets/chart.png"
                    text: qsTr("Chart")

                    width: sideBar.width
                    anchors.left: parent.left
                    anchors.top: homeBtn.bottom
                    isActiveMenu: false

                    onClicked:
                    {
                        homeBtn.isActiveMenu = false
                        chartBtn.isActiveMenu = true
                        settingsBtn.isActiveMenu = false
                        stackView.push(Qt.resolvedUrl("qrc:/UI/chartPage.qml"))
                    }
                }
            }
        }
    }
}
