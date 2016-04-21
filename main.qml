import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

QtObject
{
    property var controlWindow: Window {
        visible: true
        id: window
        width: 300
        height: 700
        color: "#F0F0F0"
        title: "Control Window";
        Rectangle
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
                onHoveredChanged: containsMouse ? buttonShadow.visible = true : buttonShadow.visible = false;
            }
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
                top: capButton.bottom;
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
        }
    }
    property var testWindow: Window
    {
        visible: true;
        width: 700;
        height: controlWindow.height;
        title: "Live View Window";
        flags: Qt.Window | Qt.WindowFullscreenButtonHint;
        color: "#F0F0F0";
        Rectangle
        {
            anchors.fill: parent;
            Text
            {
                text: "Welcome to my planetary imaging application.
This will be where the live feed of the camera will go. Move this (or exit) to see the control window.";
            }
        }
    }
}