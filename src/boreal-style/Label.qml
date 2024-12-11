import QtQuick 2.1
import QtQuick.Window 2.2
import QtQuick.Templates 2.3 as T
import BorealUI 1.0 as BorealUI

T.Label {
    id: control

    verticalAlignment: lineCount > 1 ? Text.AlignTop : Text.AlignVCenter

    activeFocusOnTab: false
    // Text.NativeRendering is broken on non integer pixel ratios
    // renderType: Window.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering

    renderType: BorealUI.Theme.renderType

    font.capitalization: BorealUI.Theme.defaultFont.capitalization
    font.family: BorealUI.Theme.fontFamily
    font.italic: BorealUI.Theme.defaultFont.italic
    font.letterSpacing: BorealUI.Theme.defaultFont.letterSpacing
    font.pointSize: BorealUI.Theme.fontSize
    font.strikeout: BorealUI.Theme.defaultFont.strikeout
    font.underline: BorealUI.Theme.defaultFont.underline
    font.weight: BorealUI.Theme.defaultFont.weight
    font.wordSpacing: BorealUI.Theme.defaultFont.wordSpacing
    color: BorealUI.Theme.textColor
    linkColor: BorealUI.Theme.linkColor

    opacity: enabled ? 1 : 0.6

    Accessible.role: Accessible.StaticText
    Accessible.name: text
}
