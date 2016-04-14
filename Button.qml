import QtQuick 2.0

Rectangle
{
    id: button;
    //property alias hover: mouseArea.containsMouse;
    signal clicked;
    signal hoverStarted;
    signal hoverFinished;
    MouseArea
    {
        id: mouseArea;
        anchors.fill: parent;
        hoverEnabled: true;
        //property bool onClicked;
        onClicked:
        {
            button.clicked();
        }
        onEntered:
        {
            button.hoverStarted();
        }
        onExited:
        {
            button.hoverFinished();
        }
    }
}
