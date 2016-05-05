TEMPLATE = app

QT += qml quick #widgets
CONFIG += c++11

SOURCES += main.cpp \
    cameracontrols.cpp

INCLUDEPATH += C:\opencv\build\include\opencv

LIBS += -L"C:\Users\Michael\Documents\ASITest\libs" \
            ASICamera.lib

LIBS += -L"C:\opencv\build\x64\vc12\lib" \
            opencv_world310.lib

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

#HEADERS += \
#    cameracontrols.h
