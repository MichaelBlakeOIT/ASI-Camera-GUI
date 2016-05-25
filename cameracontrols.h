#ifndef CAMERACONTROLS_H
#define CAMERACONTROLS_H

#include <string>
#include <qobject.h>
#include <qstring.h>

#include "OpenCV/include/cxcore.h"
#include "opencv/include/highgui.h"

class CameraControls : public QObject
{
    Q_OBJECT
public:
    CameraControls(QObject *parent = 0);
    //void startCapture();
    Q_INVOKABLE void setExpose(int exposure);
    Q_INVOKABLE void setGain(int gain);
    Q_INVOKABLE void setGamma(int gamma);
    Q_INVOKABLE void connectCamera();
    Q_INVOKABLE void captureImage();
    Q_INVOKABLE void captureVideo();
    Q_INVOKABLE void setPath(QString path);
    Q_INVOKABLE void setName(QString name);
    //void endCapture();
    ~CameraControls();
private:
    int m_gain;
    int m_exposure;
    int m_gamma;
    IplImage * m_pRgb;
    CvSize m_size;
    QString m_path;
    QString m_name;
};


#endif // CAMERACONTROLS_H
