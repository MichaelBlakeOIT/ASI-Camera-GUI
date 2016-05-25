#include <QDebug>

#include "cameracontrols.h"
#include "include/ASICamera.h"
#include "OpenCV/include/cxcore.h"
#include "opencv/include/highgui.h"

CameraControls::CameraControls(QObject * parent) : m_pRgb(nullptr), m_gain(50), m_exposure(50), m_gamma(50), m_size(cvSize(640,480))
{}

void CameraControls::connectCamera()
{
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
            m_pRgb=cvCreateImage(cvSize(getWidth(),getHeight()), IPL_DEPTH_8U, 1);
            setValue(CONTROL_EXPOSURE, 25000, false);
            setValue(CONTROL_GAIN, 50, false);
            startCapture();
            while(c != 27)
            {
                getImageData((BYTE*)m_pRgb->imageData, m_pRgb->imageSize, -1);
                cvShowImage("video", m_pRgb);
                c=cvWaitKey(1);
            }
            stopCapture();
        }
    }

}

void CameraControls::setExpose(int exposure)
{
    if(m_exposure != exposure)
    {
        m_exposure = exposure;
        setValue(CONTROL_EXPOSURE, exposure*500, false);
    }
}

void CameraControls::setGain(int gain)
{
    if(m_gain != gain)
    {
        m_gain = gain;
        setValue(CONTROL_GAIN, gain, false);
    }
}

void CameraControls::setGamma(int gamma)
{
    if(m_gamma != gamma)
    {
        m_gamma = gamma;
        setValue(CONTROL_GAMMA, gamma, false);
    }
}

void CameraControls::captureImage()
{
    //m_pRgb=cvCreateImage(cvSize(getWidth(),getHeight()), IPL_DEPTH_8U, 1);
    getImageData((BYTE*)m_pRgb->imageData, m_pRgb->imageSize, -1);
    cvSaveImage("test.png", m_pRgb);
}

void CameraControls::captureVideo()
{
    int codec = CV_FOURCC('P','I','M','1');
    CvVideoWriter * vwriter = cvCreateVideoWriter("test.avi", codec, 15, m_size);
    int a = 100;
    while ( a > 0 ) {
        cvWriteToAVI(vwriter, m_pRgb);
        a--;
    }
    cvReleaseVideoWriter(&vwriter);
}

CameraControls::~CameraControls()
{
    m_pRgb = nullptr;
}
