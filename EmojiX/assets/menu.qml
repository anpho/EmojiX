import bb.cascades 1.0

NavigationPane {
    id: navigationPane
    property variant ctpage: null
    property variant settingspage: null
    property variant aboutInPage: null
    Menu.definition: MenuDefinition {
        settingsAction: SettingsActionItem {
            title: qsTr("Settings")
            imageSource: "asset:///icon/ic_settings.png"
            attachedObjects: [
                ComponentDefinition {
                    source: "asset:///settings.qml"
                    id: settings
                }
            ]
            onTriggered: {
                if (! settingspage) {
                    settingspage = settings.createObject();
                }
                navigationPane.push(settingspage)
            }
        }
        helpAction: HelpActionItem {
            title: qsTr("About")
            imageSource: "asset:///icon/ic_info.png"
            onTriggered: {
                if (! aboutInPage) {
                    aboutInPage = ab.createObject();
                }
                navigationPane.push(aboutInPage)
            }
            attachedObjects: ComponentDefinition {
                source: "asset:///about.qml"
                id: ab
            }
        }
        actions: [
            ActionItem {
                title: qsTr("Review")
                imageSource: "asset:///icon/ic_browser.png"
                onTriggered: {
                    Qt.openUrlExternally("appworld://content/36352887")
                }
            }
        ]
    }
    Page {

        titleBar: TitleBar {
            title: qsTr("Emoji Collection") + Retranslate.onLocaleOrLanguageChanged
        }
        Container {

            ListView {
                layout: FlowListLayout {
                    headerMode: ListHeaderMode.Sticky

                }
                dataModel: XmlDataModel {
                    source: qsTr("emoji.xml")
                }
                listItemComponents: [
                    ListItemComponent {
                        type: "catagory"
                        StandardListItem {
                            title: (ListItemData.name)
                            description: ListItemData.desc
                        }
                    },
                    ListItemComponent {
                        type: "cheader"
                        Header {
                            title: ListItemData.title
                        }
                    },
                    ListItemComponent {
                        type: "item"
                        Button {
                            text: ListItemData.title
                        }
                    }
                ]
                onTriggered: {
                    if (indexPath.length > 1) {
                        if (! ctpage) {
                            ctpage = ct.createObject();
                        }
                        ctpage.ip = indexPath;
                        navigationPane.push(ctpage)
                    }
                }
                attachedObjects: [
                    ComponentDefinition {
                        source: "asset:///content.qml"
                        id: ct
                    },
                    ComponentDefinition {
                        source: "asset:///history.qml"
                        id: his
                    },
                    ComponentDefinition {
                        source: "asset:///fancytext.qml"
                        id: fancy
                    }
                ]

            }

        }

        actions: [

            ActionItem {
                imageSource: "asset:///icon/ic_history.png"
                title: qsTr("History") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.Signature
                onTriggered: {
                    var h = his.createObject()
                    navigationPane.push(h);

                }
            },
            ActionItem {
                imageSource: "asset:///icon/wand.png"
                title: qsTr("Fancy Text") + Retranslate.onLocaleOrLanguageChanged
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    var f = fancy.createObject();
                    navigationPane.push(f);
                }
            }
        ]
    }

    onPopTransitionEnded: {
        console.log("[poped]" + page.objectName);

    }
}
