/*
 * Copyright (C) 2021 LingmoOS Team.
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

pragma Singleton

import QtQuick 2.4
import BorealUI.Core 1.0 as BorealUICore

QtObject {
    id: theme

    property real devicePixelRatio: BorealUICore.ThemeManager.devicePixelRatio

    property bool darkMode: BorealUICore.ThemeManager.darkMode

    property color blueColor: BorealUICore.ThemeManager.blueColor
    property color redColor: BorealUICore.ThemeManager.redColor
    property color greenColor: BorealUICore.ThemeManager.greenColor
    property color purpleColor: BorealUICore.ThemeManager.purpleColor
    property color pinkColor: BorealUICore.ThemeManager.pinkColor
    property color orangeColor: BorealUICore.ThemeManager.orangeColor
    property color greyColor: BorealUICore.ThemeManager.greyColor

    property color backgroundColor: darkMode ? "#1C1C1D" : "#F3F4F9"
    property color secondBackgroundColor: darkMode ? "#2C2C2D" : "#FFFFFF"
    property color alternateBackgroundColor: darkMode ? "#3C3C3D" : "#F2F4F5"

    property color textColor: darkMode ? "#FFFFFF" : "#323238"
    property color disabledTextColor: darkMode ? "#888888" : "#64646E"

    property color highlightColor: BorealUICore.ThemeManager.accentColor
    property color highlightedTextColor: darkMode ? "#FFFFFF" : "#FFFFFF"

    property color activeTextColor: "#0176D3"
    property color activeBackgroundColor: "#0176D3"

    property color linkColor: "#2196F3"
    property color linkBackgroundColor: "#2196F3"
    property color visitedLinkColor: "#2196F3"
    property color visitedLinkBackgroundColor: "#2196F3"

    property real fontSize: BorealUICore.ThemeManager.fontSize
    property string fontFamily: BorealUICore.ThemeManager.fontFamily

    property real smallRadius: 8.0
    property real mediumRadius: 10.0
    property real bigRadius: 12.0
    property real hugeRadius: 14.0
    property real windowRadius: 11.0

    property var renderType: Text.QtRendering

    property font defaultFont: fontMetrics.font
    property font smallFont: {
        let font = fontMetrics.font
        if (!!font.pixelSize) {
            font.pixelSize =- 2
        } else {
            font.pointSize =- 2
        }
        return font
    }

    property list<QtObject> children: [
        TextMetrics {
            id: fontMetrics
        }
    ]
}
