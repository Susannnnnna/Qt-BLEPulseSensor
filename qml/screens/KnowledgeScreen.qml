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

    // Flickable {
    //     id: flickableArea
    //     clip: true // zapobiega wyświetlaniu elementów poza obszarem przewijania
    //     //width: parent.width
    //     //height: parent.height
    //     contentWidth: contentItem.width
    //     contentHeight: contentItem.height
    //     //flickableDirection: Flickable.StopAtBounds
    //     //interactive: true

            // ListText {
            //     innerText: qsTr(model.description)
            //     Layout.preferredWidth: knowledgeInfo.width * 0.3
            // }
            // LineSeparator {
            //     lineHeight: MyStyles.listLineHeight
            //     lineColor: MyStyles.listLineColor
            // }
    //}
}
