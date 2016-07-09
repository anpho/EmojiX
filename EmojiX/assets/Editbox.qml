import bb.cascades 1.0

Container {
    leftPadding: 5.0
    rightPadding: 5.0
    bottomPadding: 5.0
    topPadding: 5.0
    property alias eb: editbox
    function pastein(text) {
        editbox.editor.insertPlainText(text)
        editbox.requestFocus()
    }
    TextArea {
        id: editbox
        hintText: qsTr("Emoji would be copied here.")
        textFormat: TextFormat.Plain
        input.submitKey: SubmitKey.None
        input.submitKeyFocusBehavior: SubmitKeyFocusBehavior.Keep
        horizontalAlignment: HorizontalAlignment.Fill
    }
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight

        }
        Button {
            text: qsTr("Cut")
            onClicked: {
                _app.setTextToClipboard(editbox.text)
                editbox.text = "";
            }
            imageSource: "asset:///icon/ic_cut.png"
        }
        Button {
            text: qsTr("Copy")
            onClicked: {
                _app.setTextToClipboard(editbox.text)
            }
            imageSource: "asset:///icon/ic_copy.png"
        }
        Button {
            text: qsTr("Clear")
            onClicked: {
                editbox.text = "";
            }
            imageSource: "asset:///icon/ic_clear.png"
        }
    }
}
