import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"
import "../styles"

Page {
    anchors.fill: parent
    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    property string pulseTitle: "Pulse [bpm]"
    property string hrvTitle: "HRV [ms]"
    property string timestampTitle: "Time"

    ListView {
        id: pulseLisView
        anchors.fill: parent
        clip: true

        model: ListModel {
            ListElement { pulseValue: "70"; hrvValue: "77"; timeStamp: "2020-10-10 10:10" }
            ListElement { pulseValue: "70"; hrvValue: "80"; timeStamp: "2020-10-10 10:20" }
            ListElement { pulseValue: "80"; hrvValue: "99"; timeStamp: "2020-10-10 10:30" }
            ListElement { pulseValue: "70"; hrvValue: "67"; timeStamp: "2020-10-10 10:40" }
            ListElement { pulseValue: "71"; hrvValue: "100"; timeStamp: "2020-10-10 10:50" }
            ListElement { pulseValue: "72"; hrvValue: "87"; timeStamp: "2020-10-10 11:30" }
            ListElement { pulseValue: "74"; hrvValue: "96"; timeStamp: "2020-10-10 12:30" }
            ListElement { pulseValue: "65"; hrvValue: "91"; timeStamp: "2020-10-10 13:30" }
        }

        header:  Rectangle {
            height: 35
            width: parent.width
            color: MyStyles.cardsBackgroundColor

            RowLayout {
                anchors.fill: parent

                ListText {
                    text: qsTr(pulseTitle)
                    Layout.preferredWidth: pulseLisView.width * 0.3
                }
                ListText {
                    text: qsTr(hrvTitle)
                    Layout.preferredWidth: pulseLisView.width * 0.3
                }
                ListText {
                    text: qsTr(timestampTitle)
                    Layout.preferredWidth: pulseLisView.width * 0.3
                }
            }
            LineSeparator {
                lineHeight: MyStyles.listLineHeight
                lineColor: MyStyles.listLineColor
            }
        }



        delegate: Rectangle {
            id: pulseInfo
            width: pulseLisView.width
            height: 32
            color: MyStyles.cardsBackgroundColor

                RowLayout {
                width: parent.width

                ListText {
                    innerText: qsTr(model.pulseValue)
                    Layout.preferredWidth: pulseInfo.width * 0.3
                }

                ListText {
                    innerText: qsTr(model.hrvValue)
                    Layout.preferredWidth: pulseInfo.width * 0.3
                }

                ListText {
                    innerText: qsTr(model.timeStamp)
                    Layout.preferredWidth: pulseInfo.width * 0.3
                }

            }

            LineSeparator {
                lineHeight: MyStyles.listLineHeight
                lineColor: MyStyles.listLineColor
            }

        }
    }
}
















