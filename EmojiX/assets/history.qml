import bb.cascades 1.0
Page {
    property string splitter: "   "
    property variant historyInPage: []
    function save() {
        var trimmed = removeDuplicatesInPlace(historyInPage);
        historyInPage = trimmed;
        _app.setValue("history", historyInPage.reverse().join(splitter));
    }

    function removeDuplicatesInPlace(arr) {
        var i, j, cur;
        for (i = arr.length - 1; i >= 0; i --) {
            cur = arr[i];
            for (j = i - 1; j >= 0; j --) {
                if (cur === arr[j]) {
                    if (i !== j) {
                        arr.splice(i, 1);
                    }
                }
            }
        }
        return arr;
    }
    actions: [
        ActionItem {
            title: qsTr("Clear")
            ActionBar.placement: ActionBarPlacement.Signature
            imageSource: "asset:///icon/ic_delete.png"
            onTriggered: {
                _app.setValue("history", "");
                historyInPage = [];
                arrayModel.clear()
            }
        }
    ]
    titleBar: TitleBar {
        title: qsTr("History")

    }
    actionBarVisibility: ChromeVisibility.Compact
    Container {
        leftPadding: 20.0
        rightPadding: 20.0
        bottomPadding: 20.0
        verticalAlignment: VerticalAlignment.Fill
        horizontalAlignment: HorizontalAlignment.Fill
        Label {
            text: qsTr("Empty")
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            visible: historyInPage.length == 0
        }
        ListView {

            id: itemroot
            dataModel: ArrayDataModel {
                id: arrayModel
            }
            onCreationCompleted: {
                var histories = _app.getValue("history", "");
                if (histories === "") {
                    histories = [];
                } else {
                    histories = histories.split(splitter).reverse();
                }
                historyInPage = histories;
                arrayModel.clear();
                arrayModel.append(histories);
            }
            function copy(txt) {
                _app.setTextToClipboardWithoutHistory(txt);
            }
            function removeHistoryAt(i) {
                var _hh = historyInPage;
                _hh.splice(i, 1);
                historyInPage = _hh;
                console.log(JSON.stringify(historyInPage))
                save()
            }
            listItemComponents: [
                ListItemComponent {
                    Container {
                        layout: DockLayout {

                        }
                        id: ll
                        horizontalAlignment: HorizontalAlignment.Fill
                        preferredWidth: Infinity
                        Label {
                            text: ListItemData
                            gestureHandlers: TapHandler {
                                onTapped: {
                                    ll.ListItem.view.copy(ListItemData)
                                }
                            }
                            horizontalAlignment: HorizontalAlignment.Left
                            verticalAlignment: VerticalAlignment.Center
                            textStyle.fontSize: FontSize.Large
                            multiline: true
                        }
                        ImageButton {
                            horizontalAlignment: HorizontalAlignment.Right
                            verticalAlignment: VerticalAlignment.Center
                            scaleX: 0.8
                            scaleY: 0.8
                            onClicked: {
                                var i = ll.ListItem.indexInSection;
                                console.log(i);
                                ll.ListItem.view.removeHistoryAt(i)
                                ll.ListItem.view.dataModel.removeAt(i);
                            }
                            defaultImageSource: "asset:///icon/ic_clear.png"
                        }

                        Divider {
                            verticalAlignment: VerticalAlignment.Bottom
                            horizontalAlignment: HorizontalAlignment.Center

                        }
                    }
                }
            ]
            horizontalAlignment: HorizontalAlignment.Fill
        }
    }
}
