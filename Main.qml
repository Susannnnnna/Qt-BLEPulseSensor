import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material
import "qml/styles"
import "./qml/screens"
import "./qml/components"

ApplicationWindow {
    visible: true
    width: 360
    height: 640

    // Screens paths
    property string pulseScreenPath:        MyStyles.rootPath + "qml/screens/PulseScreen.qml"
    property string dataScreenPath:         MyStyles.rootPath + "qml/screens/DataScreen.qml"
    property string knowledgeScreenPath:    MyStyles.rootPath + "qml/screens/KnowledgeScreen.qml"

    // Menus titles
    property string headerTitle:            "Monitor Your Pulse!"
    property string pulseTitle:             "Pulse"
    property string dataTitle:              "Data"
    property string knowledgeTitle:         "Knowledge"

    // Icons paths
    property string sideMenuIcon:           MyStyles.rootPath + "assets/icons/dots.png"
    property string chartsIcon:             MyStyles.rootPath + "assets/icons/analysis.png"
    property string heartIcon:              MyStyles.rootPath + "assets/icons/heart.png"
    property string heartDigitalIcon:       MyStyles.rootPath + "assets/icons/love-always-wins.png"
    property string konwledgeIcon:          MyStyles.rootPath + "assets/icons/light-bulb.png"
    property string homeIcon:               MyStyles.rootPath + "assets/icons/home.png"

    Material.accent: "transparent"
    background: Rectangle {
        color: MyStyles.backgroundColor
    }

    header: ToolBar {
        contentHeight: 60
        background: Rectangle {
            color: MyStyles.ribbonColor
        }

        Row {
            width: parent.width
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5

            // Left side header
            ToolButton {
                hoverEnabled: false
                highlighted: false

                ImageIcons {
                    iconPath: sideMenuIcon
                }

                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    if (drawer.visible) {
                        drawer.close()
                    } else {
                        drawer.open()
                    }
                }
            }

            // Transparent space to center
            Rectangle {
                width: parent.width * 0.25
                height: 1
                color: "transparent"
            }

            // Middle side header
            Row {
                spacing: 5
                anchors.centerIn: parent

                Label {
                    id: headerLabel
                    text: headerTitle
                    color: MyStyles.backgroundColor
                    font.pointSize: MyStyles.fontSize
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // Transparent space to center
            Rectangle {
                width: parent.width * 0.25
                height: 1
                color: "transparent"
            }

            // Right side header
            ToolButton {
                id: homeButton
                visible: false

                hoverEnabled: false
                highlighted: false

                ImageIcons {
                    iconPath: homeIcon
                }

                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    headerLabel.text = headerTitle
                    homeButton.visible = false
                    stackView.push(pulseScreenPath)
                    footer.visible = true
                }
            }
        }

        // Line on the top of the header
        LineSeparator {
            lineHeight: 2
            lineColor: MyStyles.linesColor
        }
    }

    // Side menu
    Drawer {
        id: drawer
        width: parent.width * 0.5
        height: parent.height
        edge: Qt.LeftEdge

        background: Rectangle {
            color: MyStyles.cardsBackgroundColor
        }

        ListView {
            width: parent.width
            height: parent.height
            model: [
                pulseTitle,
                dataTitle,
                knowledgeTitle
            ]
            delegate: ItemDelegate {
                width: parent.width
                height: 50

                contentItem: Text {
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    text: modelData
                    font.pointSize: MyStyles.fontSize
                    color: MyStyles.backgroundColor
                }

                highlighted: false
                hoverEnabled: false

                LineSeparator {
                    lineColor:MyStyles.linesColor
                    lineHeight: 1
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        drawer.close()
                        if (modelData === pulseTitle) {
                            homeButton.visible = true
                            headerLabel.text = pulseTitle
                            stackView.push(pulseScreenPath)
                            footer.visible = false
                        } else if (modelData === dataTitle) {
                            homeButton.visible = true
                            headerLabel.text = dataTitle
                            stackView.push(dataScreenPath)
                            footer.visible = false
                        } else if (modelData === knowledgeTitle) {
                            homeButton.visible = true
                            headerLabel.text = knowledgeTitle
                            stackView.push(Qt.resolvedUrl(knowledgeScreenPath))
                            footer.visible = false
                        } else {
                            stackView.push(Qt.resolvedUrl(pulseScreenPath), { category: modelData })
                        }
                    }
                }
            }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: pulseScreenPath

        onCurrentItemChanged:
            tabBar.visible = !(stackView.currentItem instanceof HomeScreen)
    }

    footer: TabBar {
        id: footer
        height: 50

        background: Rectangle {
            color: MyStyles.ribbonColor
        }

        TabButtonFooter {
            stackViewPath: Qt.resolvedUrl(pulseScreenPath)
            iconPath: heartIcon
        }

        TabButtonFooter {
            stackViewPath: Qt.resolvedUrl(dataScreenPath)
            iconPath: chartsIcon
        }

        TabButtonFooter {
            stackViewPath: Qt.resolvedUrl(knowledgeScreenPath)
            iconPath: konwledgeIcon
        }
    }
}
