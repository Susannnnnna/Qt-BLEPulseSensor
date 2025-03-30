import QtQuick
import QtQuick.Controls
import "../styles"

Rectangle {
    width: parent.width
    height: parent.height

    property string title
    property string description

    color: MyStyles.cardsBackgroundColor
    border.color: MyStyles.linesColor
    border.width: 0
    radius: 10

    Column {
        width: parent.width
        spacing: 5
        padding: 5

        Text {
            text: title
            color: MyStyles.backgroundColor
            font.bold: true
            font.pointSize: MyStyles.fontSize
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            width: parent.width
            text:  description
            color: MyStyles.backgroundColor
            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            textFormat: Text.RichText
        }
    }
}
