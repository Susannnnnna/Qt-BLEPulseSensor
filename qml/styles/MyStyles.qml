pragma Singleton
import QtQuick

QtObject {
    property string rootPath:       Qt.resolvedUrl("../../")

    // *** GENERAL SETTINGS ***
    property color backgroundColor: "#090590" // darkx3 blue
    property color linesColor:      "#09065C" //"black"
    property color ribbonColor:     "#0E45FC" //dark blue
    property string fontStyle:      "Courier New"
    property int fontSize:          16
    property color fontColor:       "#99FFFF" // light blue

    // *** CARDS PROPERIES ***
    property color cardsBackgroundColor: "#57A4F0" // light blue

    // *** LIST PROPERIES ***
    property color listLineColor: "#09065C" // "#99FFFF" - light blue
    property real listLineHeight: 1

    // *** ICONS SETTINGS ***
    property real iconWidth: 30
    property real iconHeight: 30

}
