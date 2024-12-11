import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12

import BorealUI 1.0 as BorealUI

T.MenuItem
{
    id: control

    property color hoveredColor: BorealUI.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.2)
                                                       : Qt.rgba(0, 0, 0, 0.1)
    property color pressedColor: BorealUI.Theme.darkMode ? Qt.rgba(255, 255, 255, 0.1)
                                                       : Qt.rgba(0, 0, 0, 0.2)

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    verticalPadding: BorealUI.Units.smallSpacing
    hoverEnabled: true
    topPadding: BorealUI.Units.smallSpacing
    bottomPadding: BorealUI.Units.smallSpacing

    icon.width: BorealUI.Units.iconSizes.medium
    icon.height: BorealUI.Units.iconSizes.medium

    icon.color: control.enabled ? (control.highlighted ? control.BorealUI.Theme.highlightColor : control.BorealUI.Theme.textColor) :
                             control.BorealUI.Theme.disabledTextColor

    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu && control.arrow ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable && control.indicator ? control.indicator.width + control.spacing : 0
        leftPadding: !control.mirrored ? indicatorPadding + BorealUI.Units.smallSpacing * 2 : arrowPadding
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding + BorealUI.Units.smallSpacing * 2

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.enabled ? control.pressed || control.hovered ? control.BorealUI.Theme.textColor :
               BorealUI.Theme.textColor : control.BorealUI.Theme.disabledTextColor
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: control.visible ? BorealUI.Units.gridUnit + BorealUI.Units.largeSpacing : 0
        radius: BorealUI.Theme.mediumRadius
        opacity: 1

        anchors {
            fill: parent
            leftMargin: BorealUI.Units.smallSpacing
            rightMargin: BorealUI.Units.smallSpacing
        }

        color: control.pressed || highlighted ? control.pressedColor : control.hovered ? control.hoveredColor : "transparent"
    }
}
