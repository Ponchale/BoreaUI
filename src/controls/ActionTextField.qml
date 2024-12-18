/*
  * Copyright (C) 2021 BorealOS Team.
 * Copyright (C) 2024 Astian Team.
 *
 * Author:     lingmo <lingmo@lingmo.org>
 * Author:     astian <contact@astian.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import BorealUI 1.0 as BorealUI

TextField {
    id: control

    property list<QtObject> rightActions

    rightPadding: BorealUI.Units.smallSpacing + rightActionsRow.width

    Row {
        id: rightActionsRow
        padding: BorealUI.Units.smallSpacing
        layoutDirection: Qt.RightToLeft
        anchors.right: parent.right
        anchors.rightMargin: BorealUI.Units.smallSpacing
        anchors.verticalCenter: parent.verticalCenter
        height: control.implicitHeight - 2 * BorealUI.Units.smallSpacing
        Repeater {
            model: control.rightActions
            Icon {
                implicitWidth: BorealUI.Units.iconSizes.small
                implicitHeight: BorealUI.Units.iconSizes.small

                anchors.verticalCenter: parent.verticalCenter

                source: modelData.icon.name.length > 0 ? modelData.icon.name : modelData.icon.source
                enabled: modelData.enabled
                MouseArea {
                    id: actionArea
                    anchors.fill: parent
                    onClicked: modelData.trigger()
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
    
}
