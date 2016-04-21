import QtQuick 2.0

Rectangle
{
    id: dialog;
    property alias text: textItem.text
    property alias fontColor: textItem.color;
    property alias backgroundColor: dialog.color;
    border.color: "black";
    border.width: 1;
    Text
    {
        width: parent.width;
        id: textItem;
        font.family: "Helvetica";
        font.pointSize: 8;
        wrapMode: Text.WordWrap;
    }
    MouseArea
    {
        anchors.fill: parent;
        drag.target: parent;
    }
}
