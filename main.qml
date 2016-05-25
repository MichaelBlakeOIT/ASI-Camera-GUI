import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.1

QtObject
{
    property var controlWindow: Window {
        visible: true
        id: window
        width: 300
        height: 700
        color: "#F0F0F0"
        title: "Control Window";
        TabView
        {
            id: tabView

            anchors.fill: parent
            //anchors.margins: UI.margin
            //tabPosition: UI.tabPosition

            Layout.minimumWidth: 360
            Layout.minimumHeight: 360
            Layout.preferredWidth: 480
            Layout.preferredHeight: 640

            Tab {
                title: "Controls"
                Controls
                {

                }
            }
            Tab
            {
                title: "Settings";
                AppSettings
                {

                }
            }
        }

        /*Rectangle
        {
            z: 1;
            id: capButton;
            width: parent.width;
            height: parent.height * .1;
            color: "#1E90FF";
            Text
            {
                text: "Start Capture";
                anchors.horizontalCenter: capButton.horizontalCenter;
                anchors.verticalCenter: capButton.verticalCenter;
                font.pointSize: 18;
            }
            MouseArea
            {
                hoverEnabled: true;
                anchors.fill: parent;
                //onHoveredChanged: containsMouse ? buttonShadow.visible = true : buttonShadow.visible = false;
            }
        }
        Rectangle
        {
            //z: 1;
            id: stillButton;
            width: parent.width;
            //height: 50;
            anchors.top: capButton.bottom;
            color: "#1790FF";
            Text
            {
                text: "Take Still";
                anchors.horizontalCenter: stillButton.horizontalCenter;
                anchors.verticalCenter: stillButton.verticalCenter;
                font.pointSize: 18;
            }
            MouseArea
            {
                hoverEnabled: true;
                anchors.fill: parent;
                //onHoveredChanged: containsMouse ? buttonShadow.visible = true : buttonShadow.visible = false;
            }
        }
        /*DropShadow
        {
            visible: false;
            z: 0;
            id: stillShadow;
            anchors.fill: stillButton;
            verticalOffset: 3;
            radius: 5.0;
            samples: 17;
            color: "#80000000";
            source: stillButton;
        }
        DropShadow
        {
            visible: false;
            z: 0;
            id: buttonShadow;
            anchors.fill: capButton;
            verticalOffset: 3;
            radius: 5.0;
            samples: 17;
            color: "#80000000";
            source: capButton;
        }
        Slider
        {
            id: exposure;
            value: 0.5;
            width: capButton.width * .6;
            anchors
            {
                top: exposureLabel.bottom;
                horizontalCenter: capButton.horizontalCenter;
            }
            anchors.topMargin: 5;
        }
        Slider
        {
            id: gain;
            value: 0.5;
            width: capButton.width * .6;
            anchors
            {
                top: gainLabel.bottom;
                horizontalCenter: capButton.horizontalCenter;
            }
            anchors.topMargin: 5;
        }
        Slider
        {
            id: gamma;
            value: 0.5;
            width: capButton.width * .6;
            anchors
            {
                top: gammaLabel.bottom;
                horizontalCenter: capButton.horizontalCenter;
            }
            anchors.topMargin: 5;
        }
        Label
        {
            id: exposureLabel;
            text: "Exposure"
            anchors.topMargin: 20;
            anchors
            {
                top: stillButton.bottom;
                horizontalCenter: capButton.horizontalCenter;
            }
        }
        Label
        {
            id: gainLabel;
            text: "Gain"
            anchors.topMargin: 20;
            anchors
            {
                top: exposure.bottom;
                horizontalCenter: capButton.horizontalCenter;
            }
        }
        Label
        {
            id: gammaLabel;
            text: "Gamma"
            anchors.topMargin: 20;
            anchors
            {
                top: gain.bottom;
                horizontalCenter: capButton.horizontalCenter;
            }
        }*/
    }
    property var testWindow: Window
    {
        visible: true;
        width: 400;
        height: 200;
        title: "Live View Window";
        flags: Qt.Window | Qt.WindowFullscreenButtonHint;
        color: "#F0F0F0";
        Rectangle
        {
            anchors.fill: parent;
            Text
            {
                text: "This application is meant to be used with a ZWO ASI120MC camera.\n\
Please contact me if you need to test all functionality.";
                horizontalAlignment: parent.horizontalCenter;
            }
        }
    }
}
