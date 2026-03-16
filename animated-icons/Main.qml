import QtQuick
import QtQuick.Controls
import RiveQml 1.0

ApplicationWindow {
    width: 420
    height: 460
    visible: true
    title: "Animated Icons"

    Column {
        anchors.fill: parent
        spacing: 8

        RiveItem {
            id: riveView
            width: parent.width
            height: parent.height - errorText.implicitHeight - parent.spacing
            source: Qt.resolvedUrl("assets/animatedIcons.riv")
            artboard: "master"
            stateMachine: "State Machine 1"
        }

        Text {
            id: errorText
            width: parent.width
            text: riveView.errorString
            visible: text.length > 0
            wrapMode: Text.Wrap
        }
    }
}
