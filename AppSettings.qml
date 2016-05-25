import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import Qt.labs.settings 1.0

Item {

    Label
    {
        anchors.verticalCenter: pathField.verticalCenter;
        id: pathLabel;
        x: 10;
        text: "File Save Path"
    }
    TextField {
        id: pathField;
        y: 10;
        objectName: "path"
        width: parent.width * .5;
        anchors.leftMargin: 10;
        height: 20;
        anchors.left: pathLabel.right;
        text: settings_global.text;
        Settings
        {
             id: settings_global
             property alias text: pathField.text;
        }
        style: TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                radius: 2
                implicitWidth: 100
                implicitHeight: 24
                border.color: "#333"
                border.width: 1
            }
        }
        onFocusChanged:
        {
            Camera.setPath(text);
        }
    }
    Label
    {
        anchors.verticalCenter: nameField.verticalCenter;
        id: nameLabel;
        x: 10;
        text: "File name"
    }
    TextField {
        id: nameField;
        width: parent.width * .5;
        anchors.leftMargin: 10;
        anchors.topMargin: 10;
        anchors.top: pathField.bottom;
        height: 20;
        anchors.left: nameLabel.right;
        style: TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                radius: 2
                implicitWidth: 100
                implicitHeight: 24
                border.color: "#333"
                border.width: 1
            }
        }
        onFocusChanged:
        {
            Camera.setName(text);
        }
    }
}
