APP_NAME = EmojiX

CONFIG += qt warn_on cascades10
LIBS += -lclipboard
LIBS += -lbbsystem
include(config.pri)


lupdate_inclusion {
    SOURCES += \
        $$BASEDIR/../assets/*.qml
}