import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Item
{
     Rectangle
     {
            z: 1;
            id: capButton;
            width: parent.width;
            height: parent.height * .1;
            anchors.top: connectButton.bottom;
            color: "#EC407A";
            Text
            {
                id: captureText;
                text: "Start Capture";
                color: "black";
                opacity: 0.62;
                anchors.horizontalCenter: capButton.horizontalCenter;
                anchors.verticalCenter: capButton.verticalCenter;
                font.pointSize: 18;
            }
            MouseArea
            {
                hoverEnabled: true;
                anchors.fill: parent;
                onEntered:
                {
                    captureText.opacity = 1;
                    captureText.color = "white";
                    capButton.color = "#E91E63";
                }
                onExited:
                {
                    captureText.color = "black";
                    captureText.opacity = 0.62;
                    capButton.color = "#EC407A";
                }
                onClicked:
                {
                    Camera.captureVideo();
                }
            }
      }
     Rectangle
     {
            z: 1;
            id: connectButton;
            width: parent.width;
            height: parent.height * .1;
            color: "#FB8C00";
            Text
            {
                id: connectText;
                text: "Connect Camera";
                color: "black";
                opacity: 0.62;
                anchors.horizontalCenter: connectButton.horizontalCenter;
                anchors.verticalCenter: connectButton.verticalCenter;
                font.pointSize: 18;
            }
            MouseArea
            {
                hoverEnabled: true;
                anchors.fill: parent;
                onEntered:
                {
                    connectText.opacity = 1;
                    connectText.color = "white";
                    connectButton.color = "#F57C00";
                }
                onExited:
                {
                    connectText.color = "black";
                    connectText.opacity = 0.62;
                    connectButton.color = "#FB8C00";
                }
                onClicked:
                {
                    Camera.connectCamera();
                }
            }
      }
     Rectangle
     {
            z: 1;
            id: stillButton;
            width: parent.width;
            height: parent.height * .1;
            anchors.top: capButton.bottom;
            color: "#2196F3";
            Text
            {
                id: stillText;
                text: "Take Still";
                color: "black";
                opacity: 0.62;
                anchors.horizontalCenter: stillButton.horizontalCenter;
                anchors.verticalCenter: stillButton.verticalCenter;
                font.pointSize: 18;
            }
            MouseArea
            {
                hoverEnabled: true;
                anchors.fill: parent;
                onEntered:
                {
                    stillText.opacity = 1;
                    stillText.color = "white";
                    stillButton.color = "#1E88E5";
                }
                onExited:
                {
                    stillText.color = "black";
                    stillText.opacity = 0.62;
                    stillButton.color = "#2196F3";
                }
                onClicked:
                {
                    Camera.captureImage();
                }
            }
      }
      Slider
      {
          id: exposure;
          maximumValue: 100;
          value: 50;
          width: capButton.width * .6;
          enabled: !autoExpose.checked;
          anchors
          {
              top: exposureLabel.bottom;
              horizontalCenter: capButton.horizontalCenter;
              topMargin: 5;
          }

          onValueChanged:
          {
              //if(!exposetimer.running)
              //{
                  Camera.setExpose(value);
                  //exposetimer.restart();
              //}
          }
      }
      Slider
      {
          id: gain;
          maximumValue: 100;
          value: 50;
          width: capButton.width * .6;
          anchors
          {
              top: gainLabel.bottom;
              horizontalCenter: capButton.horizontalCenter;
          }
          Timer
          {
              id: gaintimer;
              interval: 200;
              running: true;
              repeat: false;
              onTriggered:
              {
                 // if(!gain.pressed)
                  //{
                    //  Camera.setGain(gain.value);
                  //}
              }
          }
          onValueChanged:
          {
              if(!gaintimer.running)
              {
                  Camera.setGain(value);
                  //gaintimer.restart();
              }
          }
          anchors.topMargin: 5;
      }
      Slider
      {
          id: gamma;
          maximumValue: 100;
          value: 50;
          width: capButton.width * .6;
          anchors
          {
              top: gammaLabel.bottom;
              horizontalCenter: capButton.horizontalCenter;
          }
          onValueChanged:
          {
              Camera.setGamma(value);
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
      }
      Label
      {
          id: tempText;
          text: "Sensor Temperature: " + Camera.getTemp();

          Timer
          {
              interval: 500;
              running: true;
              repeat: true
              onTriggered: tempText.text = "Sensor Temperature: " + Camera.getTemp() + "° C";
          }
          anchors
          {
              top: gamma.bottom;
              topMargin: 20;
              horizontalCenter: capButton.horizontalCenter;
          }
      }
      Label
      {
          id: fpsText;
          text: "Frames Per Second: " + Camera.getFrames();
          Timer
          {
              id: fpstimer;
              interval: 1000;
              running: true;
              repeat: false;
              onTriggered:
              {
                  text = Camera.getFrames();
                  count = 0;
              }
          }
          anchors
          {
              top: tempText.bottom;
              topMargin: 20;
              horizontalCenter: capButton.horizontalCenter;
          }
      }

      RadioButton
      {
          id: autoExpose
          text: "Auto Exposure";
          anchors
          {
              top: fpsText.bottom;
              topMargin: 20;
              horizontalCenter: capButton.horizontalCenter;
          }
          onClicked: Camera.setExpose(checked);
      }
}
