#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QSlider>

#include "cameracontrols.h"
#include "include/ASICamera.h"
#include "OpenCV/include/cxcore.h"
#include "opencv/include/highgui.h"

void tempFunction()
{
    IplImage * pRgb;
    int bresult = 0;
    int numDevices = getNumberOfConnectedCameras();
    if(numDevices > 0)
    {
        bresult = openCamera(0);
        if(bresult)
        {
            char c = 0;
            initCamera();
            setImageFormat(640, 480, 1, IMG_Y8);
            cvNamedWindow("video", 1);
            pRgb=cvCreateImage(cvSize(getWidth(),getHeight()), IPL_DEPTH_8U, 1);
            setValue(CONTROL_EXPOSURE, 33*1000, true); //auto exposure
            startCapture();
            while(c != 27)
            {
                getImageData((BYTE*)pRgb->imageData, pRgb->imageSize, -1);
                cvShowImage("video", pRgb);
                c=cvWaitKey(1);
            }
            stopCapture();
        }
    }
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    tempFunction();
    return app.exec();
}
