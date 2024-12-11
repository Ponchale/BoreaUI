import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import BorealUI 1.0 as BorealUI

T.TabButton {
    id: control

    property int standardHeight: BorealUI.Units.iconSizes.medium + BorealUI.Units.smallSpacing
    property color pressedColor: Qt.rgba(BorealUI.Theme.textColor.r, BorealUI.Theme.textColor.g, BorealUI.Theme.textColor.b, 0.5)

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             standardHeight)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    padding: 0
    spacing: 0

    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

        text: control.text
        font: control.font
        color: !control.enabled ? BorealUI.Theme.disabledTextColor : control.pressed ? pressedColor : control.checked ? BorealUI.Theme.textColor : BorealUI.Theme.textColor
    }
}
