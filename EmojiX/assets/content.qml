import bb.cascades 1.0
Page {
    property alias ip: lv.rootIndexPath

    actions: [
        ActionItem {
            imageSource: "asset:///icon/ic_compose.png"
            title: qsTr("Editbox")
            ActionBar.placement: ActionBarPlacement.Signature
            onTriggered: {
                editbox.visible = ! editbox.visible
            }
        }
    ]
    actionBarVisibility: ChromeVisibility.Default
    actionBarAutoHideBehavior: ActionBarAutoHideBehavior.HideOnScroll
    Container {
        Editbox {
            id: editbox
            visible: false
        }
        ListView {
            id: lv
            layout: FlowListLayout {
                headerMode: ListHeaderMode.Sticky
            }
            function copy(txt) {
                if (editbox.visible) {
                    editbox.pastein(txt)
                    editbox.requestFocus()
                } else {
                    _app.setTextToClipboard(txt);
                }
            }
            dataModel: XmlDataModel {
                source: qsTr("emoji.xml")
            }
            listItemComponents: [
                ListItemComponent {
                    type: "cheader"
                    Header {
                        title: (ListItemData.title)
                    }
                },
                ListItemComponent {
                    type: "item"
                    Container {
                        id: itemroot
                        Button {
                            text: (ListItemData.title)
                            preferredHeight: 1
                            preferredWidth: 1
                            onClicked: {
                                itemroot.ListItem.view.copy(text);
                            }
                        }
                        topMargin: 10.0
                        leftMargin: 10.0
                        rightMargin: 10.0
                        bottomMargin: 10.0
                    }
                },
                ListItemComponent {
                    type: "unicodeitem"
                    Container {
                        id: unicoderoot
                        topMargin: 10.0
                        leftMargin: 10.0
                        rightMargin: 10.0
                        bottomMargin: 10.0
                        Label {
                            text: ListItemData.title
                            gestureHandlers: [
                                TapHandler {
                                    onTapped: {
                                        unicoderoot.ListItem.view.copy(unicoderoot.ListItem.data.title);
                                    }
                                }
                            ]
                            textStyle.fontSize: FontSize.XXLarge
                            minHeight: 40
                            minWidth: 40
                        }
                    }
                },
                ListItemComponent {
                    type: "bigitem"
                    Container {
                        id: bigitem
                        topMargin: 10.0
                        leftMargin: 10.0
                        rightMargin: 10.0
                        bottomMargin: 30.0
                        preferredWidth: Infinity
                        horizontalAlignment: HorizontalAlignment.Fill
                        Label {
                            text: ListItemData.title
                            gestureHandlers: [
                                TapHandler {
                                    onTapped: {
                                        bigitem.ListItem.view.copy(bigitem.ListItem.data.title);
                                    }
                                }
                            ]
                            textStyle.fontSize: FontSize.XXSmall
                            minHeight: 40
                            minWidth: 40
                            multiline: true
                        }
                    }
                }
            ]
            horizontalAlignment: HorizontalAlignment.Center
            leftPadding: 10.0
            rightPadding: 10.0
            leadingVisualSnapThreshold: 0.0
            scrollIndicatorMode: ScrollIndicatorMode.ProportionalBar
            snapMode: SnapMode.None
            flickMode: FlickMode.Momentum
            scrollRole: ScrollRole.Main
        }
    }
}
