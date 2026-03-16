import QtQuick
import QtQuick.Controls
import RiveQml 1.0

ApplicationWindow {
    width: 480
    height: 560
    visible: true
    title: "Brightness Control"

    RiveViewModelAdapter {
        id: viewModel
    }

    Column {
        anchors.fill: parent
        spacing: 8

        RiveItem {
            id: riveView
            width: parent.width
            height: parent.height - slider.implicitHeight - errorText.implicitHeight - parent.spacing
            source: Qt.resolvedUrl("assets/brightnessControl.riv")
            viewModel: viewModel
        }

        Slider {
            id: slider
            width: parent.width
            from: 0
            to: 100
            stepSize: 1
            value: 50
            onValueChanged: viewModel.setValue("value", value)
        }

        Text {
            id: errorText
            width: parent.width
            text: riveView.errorString
            visible: text.length > 0
            wrapMode: Text.Wrap
        }
    }

    Component.onCompleted: viewModel.setValue("value", slider.value)
}
