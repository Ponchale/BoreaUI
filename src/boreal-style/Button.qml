import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import BorealUI 1.0 as BorealUI
import QtQuick.Controls.impl 2.12

T.Button {
    id: control
    implicitWidth: Math.max(background.implicitWidth, contentItem.implicitWidth + BorealUI.Units.largeSpacing)
    implicitHeight: background.implicitHeight
    hoverEnabled: true

    icon.width: BorealUI.Units.iconSizes.small
    icon.height: BorealUI.Units.iconSizes.small

    icon.color: control.enabled ? (control.highlighted ? control.BorealUI.Theme.highlightColor : control.BorealUI.Theme.textColor) : control.BorealUI.Theme.disabledTextColor
    spacing: BorealUI.Units.smallSpacing

    // property color hoveredColor: BorealUI.Theme.darkMode ? Qt.lighter(BorealUI.Theme.alternateBackgroundColor, 1.2)
    //                                                    : Qt.darker(BorealUI.Theme.alternateBackgroundColor, 1.1)

    // property color pressedColor: BorealUI.Theme.darkMode ? Qt.lighter(BorealUI.Theme.alternateBackgroundColor, 1.1)
    //                                                    : Qt.darker(BorealUI.Theme.alternateBackgroundColor, 1.2)

    property color hoveredColor: Qt.tint(BorealUI.Theme.textColor, Qt.rgba(BorealUI.Theme.backgroundColor.r,
                                                                       BorealUI.Theme.backgroundColor.g,
                                                                       BorealUI.Theme.backgroundColor.b, 0.9))
    property color pressedColor: Qt.tint(BorealUI.Theme.textColor, Qt.rgba(BorealUI.Theme.backgroundColor.r,
                                                                       BorealUI.Theme.backgroundColor.g,
                                                                       BorealUI.Theme.backgroundColor.b, 0.8))


    // property color borderColor: Qt.rgba(BorealUI.Theme.highlightColor.r,
    //                                     BorealUI.Theme.highlightColor.g,
    //                                     BorealUI.Theme.highlightColor.b, 0.5)

    // property color flatHoveredColor: Qt.rgba(BorealUI.Theme.highlightColor.r,
    //                                          BorealUI.Theme.highlightColor.g,
    //                                          BorealUI.Theme.highlightColor.b, 0.2)
    // property color flatPressedColor: Qt.rgba(BorealUI.Theme.highlightColor.r,
    //                                          BorealUI.Theme.highlightColor.g,
    //                                          BorealUI.Theme.highlightColor.b, 0.25)

    property color flatHoveredColor: Qt.lighter(BorealUI.Theme.highlightColor, 1.1)
    property color flatPressedColor: Qt.darker(BorealUI.Theme.highlightColor, 1.1)

    contentItem: IconLabel {
        text: control.text
        font: control.font
        icon: control.icon
        color: !control.enabled ? control.BorealUI.Theme.disabledTextColor : control.flat ? BorealUI.Theme.highlightedTextColor : BorealUI.Theme.textColor
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignCenter
    }

    background: Item {
        implicitWidth: (BorealUI.Units.iconSizes.medium * 3) + BorealUI.Units.largeSpacing
        implicitHeight: BorealUI.Units.iconSizes.medium + BorealUI.Units.smallSpacing

        Rectangle {
            id: _flatBackground
            anchors.fill: parent
            radius: BorealUI.Theme.mediumRadius
            border.width: 1
            border.color: control.enabled ? control.activeFocus ? BorealUI.Theme.highlightColor : "transparent"
                                          : "transparent"
            visible: control.flat


            color: {
                if (!control.enabled)
                    return BorealUI.Theme.alternateBackgroundColor

                if (control.pressed)
                    return control.flatPressedColor

                if (control.hovered)
                    return control.flatHoveredColor

                return Qt.rgba(BorealUI.Theme.highlightColor.r,
                               BorealUI.Theme.highlightColor.g,
                               BorealUI.Theme.highlightColor.b, 0.1)
            }

            gradient: Gradient {
                orientation: Gradient.Vertical
                GradientStop { position: 0.0; color: Qt.rgba(_flatBackground.color.r,
                                                             _flatBackground.color.g,
                                                             _flatBackground.color.b, 0.85) }
                GradientStop { position: 1.0; color: Qt.rgba(_flatBackground.color.r,
                                                             _flatBackground.color.g,
                                                             _flatBackground.color.b, 1) }
            }

            // Behavior on color {
            //    ColorAnimation {
            //        duration: 200
            //        easing.type: Easing.Linear
            //    }
            // }
        }

        Rectangle {
            id: _background
            anchors.fill: parent
            radius: BorealUI.Theme.hugeRadius
            border.width: 1
            visible: !control.flat
            border.color: control.enabled ? control.activeFocus ? BorealUI.Theme.highlightColor : "transparent"
                                          : "transparent"

            color: {
                if (!control.enabled)
                    return BorealUI.Theme.alternateBackgroundColor

                if (control.pressed)
                    return control.pressedColor

                if (control.hovered)
                    return control.hoveredColor

                return BorealUI.Theme.alternateBackgroundColor
            }
        }
    }
}
