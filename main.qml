/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQml 2.12
import QtQuick 2.12
import QtQuick.Window 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
//import GameOfLifeModel 1.0
import example.org 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 760
    height: 810
    minimumWidth: 475
    minimumHeight: 300

    color: "#09102B"
    title: qsTr("Conway’s Game of Life")

    Text  {
        id: text
        text: "Displaying"
        z:10
    }

    property int nb_epochs:0;
    property int epoch :0;
    property var listModels : [];



    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        handle : Rectangle {
            implicitWidth: 15
            implicitHeight: 15
            color: SplitHandle.pressed ? "lightgreen" : (SplitHandle.hovered ? "orange" : "white")
        }

        //! [tableview]
        TableView {
            id: tableViewRealTime
            SplitView.maximumWidth: 600
            SplitView.minimumWidth: 100
            SplitView.preferredWidth: 400
            //SplitView.fillWidth:  true

            anchors {
                top: parent.top
                left: parent.left
            }

            rowSpacing: 1
            columnSpacing: 1
            ScrollBar.horizontal: ScrollBar {}
            ScrollBar.vertical: ScrollBar {}

            delegate: Rectangle {
                id: cell
                implicitWidth: 15
                implicitHeight: 15

                required property var model
                required property bool display

                color: display ? "#f3f3f4" : "#b5b7bf"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        text.text = "Displaying " + index
                        parent.model.display = !parent.display
                    }
                }
            }
            //! [tableview]

            //! [model]
            model:     GameOfLifeModel {
                id: gameOfLifeModel
            }
            //! [model]

            //! [scroll]
            contentX: (contentWidth - width) / 2;
            contentY: (contentHeight - height) / 2;
            //! [scroll]
        }

//        Rectangle {
//            height: parent.height
////            anchors {
////                horizontalCenter: parent.horizontalCenter
////                top: parent.top
////            }
//            SplitView.minimumWidth: 50
//            SplitView.maximumWidth: 200
//            color: "yellow"
//        }

        Rectangle {
            id: panelRight
            SplitView.maximumWidth: 600
            SplitView.minimumWidth: 150
            SplitView.preferredWidth: 250
            color: "lightblue"

            TableView {
                id: tableViewHistory

                //height: parent.height - footerRight.height
                anchors.fill: parent
                anchors {
                    top: parent.top

                }

                rowSpacing: 1
                columnSpacing: 1
                ScrollBar.horizontal: ScrollBar {}
                ScrollBar.vertical: ScrollBar {}

                delegate: Rectangle {
                    id: c
                    implicitWidth: 15
                    implicitHeight: 15

                    required property var model
                    required property bool display

                    color: display ? "#f3f3f4" : "#b5b7bf"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            text.text = "Displaying " + index
                            parent.model.display = !parent.display
                        }
                    }
                }

                model: GameOfLifeModel {
                    id: newGameOfLifeModel
                }

                //! [scroll]
                contentX: (contentWidth - width) / 2;
                contentY: (contentHeight - height) / 2;
                //! [scroll]
            }

            Rectangle {
                id: footerRight
                height: 70
                width : parent.width
                anchors {
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                color: "grey"
                z: 10

                RowLayout {
                    layoutDirection: Qt.Horizontal
                    spacing: 15

                    Rectangle {
                        id: leftNb
                        width: 40
                        height: 40
                        color: "white"

                        Text {
                            id: nbEpochTxt
                            text: nb_epochs
                            anchors {
                               horizontalCenter: parent.horizontalCenter
                               verticalCenter: parent.verticalCenter
                            }
                        }
                    }

                    Slider {
                        id: sliderH
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                        }

                        from: 0
                        to: 1
                        value: epoch/nb_epochs //Math.log(epoch/nb_epochs +1)
                        orientation: Qt.Horizontal
                    }
                    Rectangle {
                        id: rightNb
                        width: 40
                        height: 40
                        color: "white"

                        Text {
                            id: currentEpochTxt
                            text: epoch
                            anchors {
                               horizontalCenter: parent.horizontalCenter
                               verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }

//                SpinBox {

//                }
            }
        }
    }


    footer: Rectangle {
        signal nextStep

        id: footer
        height: 50
        color: "#F3F3F4"

        RowLayout {
            anchors.centerIn: parent

            //! [next]
            Button {
                text: qsTr("Last")
                onClicked: {
                    var updatedModel;
                    updatedModel= gameOfLifeModel.nextStep();
                    listModels.push(updatedModel)
                    tableViewHistory.model = listModels[listModels.length-1];
                    //console.log(listModels.length -1)
                    epoch = nb_epochs
                    currentEpochTxt.text = epoch
                }
            }
            //! [next]

            Item {
                width: 50
            }

            Slider {
                id: slider
                x: 245
                y: 17
                from: 0
                to: 1
                value: 0.9
            }

            Button {
                text: timer.running ? "❙❙" : "▶️"
                onClicked: timer.running = !timer.running
            }
        }

        Timer {
            id: timer
            interval: 1000 - (980 * slider.value)
            running: true
            repeat: true

            onTriggered: {
                nb_epochs ++;
                var updatedModel = gameOfLifeModel.nextStep()
                listModels.push(updatedModel)
                nbEpochTxt.text = nb_epochs
            }
        }
    }

    Component.onCompleted: {
        gameOfLifeModel.loadFile(":/gosperglidergun.cells");
    }

    Connections {
        target: sliderH
        function onMoved() {
            //récupérer l'epoch à partir de la valeur du slider
            console.log(sliderH.value)
            epoch = sliderH.value*nb_epochs-3;
            console.log(epoch)

            tableViewHistory.model = listModels[epoch+3];
            currentEpochTxt.text = epoch;
        }

    }
}
