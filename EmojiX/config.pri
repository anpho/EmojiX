# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/bb)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/bb)

            LIBS += -lbb \
                -lclipboard

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/bb)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/bb)

            LIBS += -lbb \
                -lclipboard

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/bb)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/bb)

            LIBS += -lbb \
                -lclipboard

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            INCLUDEPATH += $$quote(${QNX_TARGET}/usr/include/bb)

            DEPENDPATH += $$quote(${QNX_TARGET}/usr/include/bb)

            LIBS += -lbb \
                -lclipboard

            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/Editbox.qml) \
        $$quote($$BASEDIR/assets/VisualStyle.Bright/icon/ic_clear.png) \
        $$quote($$BASEDIR/assets/VisualStyle.Bright/icon/ic_copy.png) \
        $$quote($$BASEDIR/assets/VisualStyle.Bright/icon/ic_cut.png) \
        $$quote($$BASEDIR/assets/about.qml) \
        $$quote($$BASEDIR/assets/content.qml) \
        $$quote($$BASEDIR/assets/emoji-zh-cn.xml) \
        $$quote($$BASEDIR/assets/emoji.xml) \
        $$quote($$BASEDIR/assets/fancytext.qml) \
        $$quote($$BASEDIR/assets/history.qml) \
        $$quote($$BASEDIR/assets/icon/ic_browser.png) \
        $$quote($$BASEDIR/assets/icon/ic_clear.png) \
        $$quote($$BASEDIR/assets/icon/ic_collapse.png) \
        $$quote($$BASEDIR/assets/icon/ic_compose.png) \
        $$quote($$BASEDIR/assets/icon/ic_contact.png) \
        $$quote($$BASEDIR/assets/icon/ic_copy.png) \
        $$quote($$BASEDIR/assets/icon/ic_cut.png) \
        $$quote($$BASEDIR/assets/icon/ic_delete.png) \
        $$quote($$BASEDIR/assets/icon/ic_done.png) \
        $$quote($$BASEDIR/assets/icon/ic_email.png) \
        $$quote($$BASEDIR/assets/icon/ic_favorite.png) \
        $$quote($$BASEDIR/assets/icon/ic_forward.png) \
        $$quote($$BASEDIR/assets/icon/ic_help.png) \
        $$quote($$BASEDIR/assets/icon/ic_history.png) \
        $$quote($$BASEDIR/assets/icon/ic_home.png) \
        $$quote($$BASEDIR/assets/icon/ic_info.png) \
        $$quote($$BASEDIR/assets/icon/ic_settings.png) \
        $$quote($$BASEDIR/assets/icon/logo.png) \
        $$quote($$BASEDIR/assets/icon/wand.png) \
        $$quote($$BASEDIR/assets/menu.qml) \
        $$quote($$BASEDIR/assets/settings.qml)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/AppSettings.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/AppSettings.hpp) \
        $$quote($$BASEDIR/src/applicationui.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/VisualStyle.Bright/*.qml) \
        $$quote($$BASEDIR/../assets/VisualStyle.Bright/*.js) \
        $$quote($$BASEDIR/../assets/VisualStyle.Bright/*.qs) \
        $$quote($$BASEDIR/../assets/VisualStyle.Bright/icon/*.qml) \
        $$quote($$BASEDIR/../assets/VisualStyle.Bright/icon/*.js) \
        $$quote($$BASEDIR/../assets/VisualStyle.Bright/icon/*.qs) \
        $$quote($$BASEDIR/../assets/icon/*.qml) \
        $$quote($$BASEDIR/../assets/icon/*.js) \
        $$quote($$BASEDIR/../assets/icon/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}_zh_CN.ts) \
    $$quote($${TARGET}.ts)