import bb.cascades 1.3

Page {
    property string mark_auto_copy_after_minimize: "auto_min"
    property string use_dark_theme: "use_dark_theme"
    titleBar: TitleBar {
        title: qsTr("Settings")
        scrollBehavior: TitleBarScrollBehavior.Sticky
    }
    Container {
        Header {
            title: qsTr("App Behaviour")
        }
        Container {
            layout: DockLayout {

            }
            horizontalAlignment: HorizontalAlignment.Fill
            topPadding: 20.0
            leftPadding: 20.0
            rightPadding: 20.0
            bottomPadding: 20.0
            Label {
                text: qsTr("Minimize after copy")
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Center

            }
            ToggleButton {
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Center
                checked: (_app.getValue(mark_auto_copy_after_minimize, "0") === "1")
                onCheckedChanged: {
                    checked ? _app.setValue(mark_auto_copy_after_minimize, "1") : _app.setValue(mark_auto_copy_after_minimize, "0")
                }
            }
        }
        Container {
            topPadding: 10.0
            leftPadding: 20.0
            rightPadding: 20.0
            bottomPadding: 20.0
            Label {
                textStyle.fontSize: FontSize.XSmall
                text: qsTr("If selected, this app will minimize to background after copied to clipboard.")
                multiline: true
            }
        }
        //---------------------------------
        Header {
            title: qsTr("Theme Settings")
        }
        Container {
            layout: DockLayout {

            }
            horizontalAlignment: HorizontalAlignment.Fill
            topPadding: 20.0
            leftPadding: 20.0
            rightPadding: 20.0
            bottomPadding: 20.0
            Label {
                text: qsTr("Use Dark Theme")
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Center

            }
            ToggleButton {
                horizontalAlignment: HorizontalAlignment.Right
                verticalAlignment: VerticalAlignment.Center
                checked: Application.themeSupport.theme.colorTheme.style === VisualStyle.Dark
                onCheckedChanged: {
                    checked ? _app.setValue("use_dark_theme", "dark") : _app.setValue("use_dark_theme", "bright")
                    try {
                        Application.themeSupport.setVisualStyle(checked ? VisualStyle.Dark : VisualStyle.Bright);
                    } catch (e) {
                        console.log("ERROR: %1".arg(e))
                    }
                }

            }
        }

    }
}
