/****************
* Name: Michael Blake
* Lab: Lab 2 - Splash Screen
* Project Name: Lab2_Michael_Blake
*****************/

import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    id: controlWindow;
    x: Screen.desktopAvailableWidth - width;
    color: "#3f3f3f";
    width: 250;
    height: Screen.desktopAvailableHeight;
    visible: true;
    TextButton
    {
        buttonText: "Start Capture";
        width: parent.width * .97;
        height: width * .4;
        backgroundColor: "#00BFFF";
        anchors.horizontalCenter: parent.horizontalCenter;
        y: 4;
    }

    /*Dialog
    {
        width: parent.width * .2;
        height: width * .5;
        x: (parent.width / 2) - (width / 2);
        y: (parent.height / 2) - (height / 2);
        fontColor: "Black";
        backgroundColor: "blue";
        text: "Hello from Michael";
        TextButton
        {
            height: parent.height * .3;
            width: parent.width * .5;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            buttonText: "Goodbye!"
            onClicked:
            {
                Qt.quit();
            }
        }
    }*/
    Dialog
    {
        id: intro;
        width: 250;
        height: width * .5;
        x: (parent.width / 2) - (width / 2);
        y: (parent.height / 2) - (height / 2);
        fontColor: "Black";
        backgroundColor: "#d3d3d3";
        text: "Hello. Welcome to my example application showing that I know how to do stuff with QML.\
 I don't plan on using splash screen for my actual application, but might end up using\
 some of these components. I'm still figuring out what I want my actual application to look like.";
        TextButton
        {
            id: introButton;
            height: parent.height * .3;
            width: parent.width * .5;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.bottom: parent.bottom;
            buttonText: "Okay"
            onClicked:
            {
                intro.visible = false;
            }
        }
    }
}
