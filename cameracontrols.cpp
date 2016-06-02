#include <QDebug>

#include "cameracontrols.h"
#include "include/ASICamera.h"
#include "OpenCV/include/cxcore.h"
#include "opencv/include/highgui.h"

CameraControls::CameraControls(QObject * parent) : m_pRgb(nullptr), m_gain(50), m_exposure(50), m_gamma(50), m_size(cvSize(640,480)),
    m_connected(false), m_autoExpose(false), m_autoGain(false), m_autoGamma(false), m_frames(0)
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
            int time1 = 0;
            int time2 = 0;
            int count = 0;
            char c = 0;
            m_connected = true;
            initCamera();
            setImageFormat(640, 480, 1, IMG_Y8);
            cvNamedWindow("video", 1);
            m_pRgb=cvCreateImage(cvSize(getWidth(),getHeight()), IPL_DEPTH_8U, 1);
            setValue(CONTROL_EXPOSURE, m_exposure * 500, m_autoExpose);
            setValue(CONTROL_GAIN, m_gain, m_autoGain);
            setValue(CONTROL_GAIN, m_gamma, m_autoGamma);
            startCapture();
            time1 = GetTickCount();
            while(c != 27)
            {
                getImageData((BYTE*)m_pRgb->imageData, m_pRgb->imageSize, -1);
                cvShowImage("video", m_pRgb);
                c=cvWaitKey(1);
                time2 = GetTickCount();
                count++;
                if(time2-time1 > 1000 )
                {
                    count = 0;
                    time1=GetTickCount();
                }
            }
            //qDebug() << getSensorTemp() << '\n';
            m_connected = false;
            stopCapture();
        }
        closeCamera();
    }

}

void CameraControls::setExpose(int exposure)
{
    if(m_exposure != exposure)
    {
        m_exposure = exposure;
        setValue(CONTROL_EXPOSURE, exposure * 500, m_autoExpose);
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
    if(m_connected)
    {
        getImageData((BYTE*)m_pRgb->imageData, m_pRgb->imageSize, -1);
        QString finalPath = m_path + m_name + ".png";
        QByteArray ba = finalPath.toLatin1();
        cvSaveImage(ba.data(), m_pRgb);
    }
}

void CameraControls::captureVideo()
{
    if(m_connected)
    {
        int codec = CV_FOURCC('M','P','4','2');
        CvSize size = cvSize(640,480);
        CvVideoWriter * vwriter = cvCreateVideoWriter("test.avi", codec, 15, size);
        for(int i = 0; i < 100; i++)
        {
            getImageData((BYTE*)m_pRgb->imageData, m_pRgb->imageSize, -1);
            cvShowImage("video", m_pRgb);
            cvWriteToAVI(vwriter, m_pRgb);
        }
        cvReleaseVideoWriter(&vwriter);
    }
}

void CameraControls::setPath(QString path)
{
    m_path = path;
}

void CameraControls::setName(QString name)
{
    m_name = name;
}

double CameraControls::getTemp()
{
    return getSensorTemp();
}
void CameraControls::setAutoExpose(bool expose)
{
    m_autoExpose = expose;
    setValue(CONTROL_EXPOSURE, m_exposure * 500, m_autoExpose);
}

int CameraControls::getFrames()
{
    return m_frames;
}

CameraControls::~CameraControls()
{
    m_pRgb = nullptr;
}
