TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

INCLUDEPATH += $(ANDROID_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/$(ANDROID_NDK_TOOLCHAIN_VERSION)/libs/armeabi-v7a/include
LIBS += -L$(ANDROID_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/$(ANDROID_NDK_TOOLCHAIN_VERSION)/libs/armeabi

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
