#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QSlider>
#include <QQmlContext>

#include "cameracontrols.h"
#include "include/ASICamera.h"
#include "OpenCV/include/cxcore.h"
#include "opencv/include/highgui.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    CameraControls c;
    engine.rootContext()->setContextProperty("Camera", &c);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
