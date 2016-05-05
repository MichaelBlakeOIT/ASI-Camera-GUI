#include <QDebug>

#include "cameracontrols.h"
#include "include/ASICamera.h"
#include "OpenCV/include/cxcore.h"
#include "opencv/include/highgui.h"

CameraControls::CameraControls()
{}
void CameraControls::startCapture()
{

}

void CameraControls::setExposure(int exposure)
{
    m_exposure = exposure;
}

void CameraControls::setGain(int gain)
{
    m_gain = gain;
}

void CameraControls::setGamma(int gamma)
{
    m_gamma = gamma;
}

void CameraControls::connectCamera()
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

void CameraControls::endCapture()
{

}

CameraControls::~CameraControls()
{}
