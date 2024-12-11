import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Templates 2.12 as T
import BorealUI 1.0 as BorealUI

T.MenuSeparator {
    id: control

    implicitHeight: BorealUI.Units.largeSpacing + separator.height
    width: parent.width

    background: Rectangle {
        id: separator
        anchors.centerIn: control
        width: control.width - BorealUI.Units.largeSpacing * 2
        height: 1
        color: BorealUI.Theme.textColor
        opacity: 0.3
    }
}