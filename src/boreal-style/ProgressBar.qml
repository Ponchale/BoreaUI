/*
 * Copyright (C) 2021 LingmoOS Team.
 * Copyright (C) 2024 Astian Team.
 *
 * Author:     lingmo <lingmo@lingmo.org>
 * Author:     astian <contact@astian.org>
 *
 * GNU Lesser General Public License Usage
 * Alternatively, this file may be used under the terms of the GNU Lesser
 * General Public License version 3 as published by the Free Software
 * Foundation and appearing in the file LICENSE.LGPLv3 included in the
 * packaging of this file. Please review the following information to
 * ensure the GNU Lesser General Public License version 3 requirements
 * will be met: https://www.gnu.org/licenses/lgpl.html.
 *
 * GNU General Public License Usage
 * Alternatively, this file may be used under the terms of the GNU
 * General Public License version 2.0 or later as published by the Free
 * Software Foundation and appearing in the file LICENSE.GPL included in
 * the packaging of this file. Please review the following information to
 * ensure the GNU General Public License version 2.0 requirements will be
 * met: http://www.gnu.org/licenses/gpl-2.0.html.
 */

import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import BorealUI 1.0 as BorealUI
import QtQuick.Controls.impl 2.12

T.ProgressBar {
    id: control
    from: 0
    to: 100

    // property color flatHoveredColor: Qt.lighter(BorealUI.Theme.highlightColor, 1.1)
    // property color flatPressedColor: Qt.darker(BorealUI.Theme.highlightColor, 1.1)

    background: Rectangle {   
        implicitWidth: _progressBar.width
        implicitHeight: _progressBar.height
        radius: BorealUI.Theme.hugeRadius
        color: rootWindow.background.color
    }

    contentItem: Item {
        Rectangle {
            id: _flatBackground
            width: _progressBar.visualPosition * _progressBar.width
            height: _progressBar.height
            radius: BorealUI.Theme.hugeRadius

            color: Qt.rgba(BorealUI.Theme.highlightColor.r,
                            BorealUI.Theme.highlightColor.g,
                            BorealUI.Theme.highlightColor.b, 0.1)
            gradient: Gradient {
                orientation: Gradient.Vertical
                GradientStop { position: 0.0; color: Qt.rgba(_flatBackground.color.r,
                                                            _flatBackground.color.g,
                                                            _flatBackground.color.b, 0.78) }
                GradientStop { position: 1.0; color: Qt.rgba(_flatBackground.color.r,
                                                            _flatBackground.color.g,
                                                            _flatBackground.color.b, 1) }
            }
        }
    }
}