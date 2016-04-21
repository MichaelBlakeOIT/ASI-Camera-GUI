#ifndef CAMERACONTROLS_H
#define CAMERACONTROLS_H

#include <string>

class CameraControls
{
public:
    CameraControls();
    void startCapture();
    void setExposure(int exposure);
    void setGain(int gain);
    void setGamma(int gamma);
    bool connectCamera();
    void endCapture();
    ~CameraControls();
private:
    int m_gain;
    int m_exposure;
    int m_gamma;
};

#endif // CAMERACONTROLS_H
