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
            Tab
            {
                title: "Info"
                Info
                {

                }
            }
        }
    }
    property var testWindow: Window
    {
        visible: true;
        width: 400;
        height: 200;
        title: "Info";
        flags: Qt.Window | Qt.WindowFullscreenButtonHint;
        color: "#F0F0F0";
        Rectangle
        {
            anchors.fill: parent;
            Text
            {
                text: "This application is meant to be used with a ZWO ASI120MC camera.\n\
Please contact me if you need to test all functionality.";
                //horizontalAlignment: parent.horizontalCenter;
            }
        }
    }
}
