import bb.cascades 1.0
import bb 1.0
Page {
    titleBar: TitleBar {
        title: qsTr("About")

    }
    actions: [
        InvokeActionItem {
            title: qsTr("Email Me")
            imageSource: "asset:///icon/ic_email.png"
            ActionBar.placement: ActionBarPlacement.Signature
            query.invokeTargetId: "sys.pim.uib.email.hybridcomposer"
            query.invokeActionId: "bb.action.SENDEMAIL"
            query.uri: "mailto:anphorea@gmail.com?subject=EmojiX " + ai.version
        }
    ]
    attachedObjects: [
        ApplicationInfo {
            id: ai
        }
    ]
    ScrollView {
        verticalAlignment: VerticalAlignment.Fill
        horizontalAlignment: HorizontalAlignment.Fill
        leftMargin: 20.0
        rightMargin: 20.0
        Container {
            leftPadding: 20.0
            rightPadding: 20.0
            topPadding: 100.0
            bottomPadding: 50.0
            ImageView {
                imageSource: "asset:///icon/logo.png"
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                topMargin: 50.0
                bottomMargin: 50.0
            }
            Label {
                text: ai.version
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                topMargin: 20.0
                bottomMargin: 20.0

            }
            Header {
                title: qsTr("Known Issues")

            }
            Label {
                text: qsTr("From 10.2.1, you can't send unicode emoji via SMS.")
                multiline: true
            }
            Header {
                title: qsTr("Author")

            }
            Label {
                text: qsTr("Merrick Zhang")
            }
            Label {
                text: qsTr("Twitter: <a href=\"http://twitter.com/anpho\">@anpho</a>")
                textFormat: TextFormat.Html
            }
            Label {
                textFormat: TextFormat.Html
                text: qsTr("<a href=\"appworld://vendor/26755\">My Apps in BlackBerry World</a>")
            }
        }
    }
}
