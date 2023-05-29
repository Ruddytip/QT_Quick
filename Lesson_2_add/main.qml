import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Shape")

    Rectangle {
        id: rectID
        anchors.centerIn: parent
        height: 200
        width: 200
        radius: 0
        color: "green"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: {
                if (mouse.button === Qt.RightButton)
                    anim.start()
                    //rectID.rotation = 45
                else if (mouse.button === Qt.LeftButton)
                    rectID.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            }

            onDoubleClicked: {
                if (mouse.button === Qt.LeftButton)
                    if(rectID.radius === 0)
                        rectID.radius = rectID.width
                    else
                        rectID.radius = 0
            }
        }
    }

    PropertyAnimation {
        id: anim
        target: rectID
        property: "rotation"
        from: 0
        to: 360
        duration: 3000
    }
}
