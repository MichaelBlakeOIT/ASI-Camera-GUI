#include "cameracontrols.h"

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

bool CameraControls::connectCamera()
{

}

void CameraControls::endCapture()
{

}

CameraControls::~CameraControls()
{}
