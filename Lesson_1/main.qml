import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Task_1 1.0

Window {
    id: primaryFrame
    width: 720
    height: 420
    visible: true
    title: qsTr("Login form")
    color: "#e5ecef"

    property string login: "login"
    property string password: "password"
    // Javascript-функция для проверки данных
    function checkCredentials() {
        if (login === loginTextField.text
        && password === passwordTextField.text)
            successAnimation.start()
        else
            failAnimation.start()
    }

    ParallelAnimation {
        id: failAnimation
        SequentialAnimation {
            // Группа анимаций внутри SequentialAnimation будет выполнена последовательно
            PropertyAnimation {
                // Текст внутри полей логина и пароля моментально изменит цвет на темно-красный
                targets: [loginTextField, passwordTextField]
                property: "color"
                to: "dark red"
                duration: 0
            }
            PropertyAnimation {
                // После этого за 400 миллисекунд вернется к обычному цвету
                targets: [loginTextField, passwordTextField]
                property: "color"
                to: secondaryFrame.textColor
                duration: 400
            }
        }
        SequentialAnimation {
            // Подложка secondaryFrame сместится на -5 пикселей относительно центра,
            //затем передвинется на позицию +5, а потом вернётся в исходное положение. Произойдет “потрясывание” формы.
            NumberAnimation { target: secondaryFrame; property:
            "anchors.horizontalCenterOffset"; to: -5; duration: 50 }
            NumberAnimation { target: secondaryFrame; property:
            "anchors.horizontalCenterOffset"; to: 5; duration: 100 }
            NumberAnimation { target: secondaryFrame; property:
            "anchors.horizontalCenterOffset"; to: 0; duration: 50 }
        }
    }

    SequentialAnimation {
        id: successAnimation
        PropertyAnimation {
            targets: [loginTextField, passwordTextField, submitButton]
            property: "opacity"
            to: 0
            duration: 400
        }
        PropertyAnimation {
            target: secondaryFrame
            property: "opacity"
            to: 0
            duration: 600
        }
    }

    Rectangle {
        id: secondaryFrame
        color: "white"
        anchors.top: parent.top
        radius: 5 // Закругление углов с выбранным радиусом
        width: 300
        height: 250
        property string textColor: "#535353" // Вынесение общих данных для дочерних элементов в переменную

        Column { // аналог QVBoxLayout
            anchors.fill: parent // объект занимает все пространство родителя
            padding: 32 // отступы по 4 сторонам от родительского элемента
            spacing: 32 // отступы между элементами

            TextField {
                id: loginTextField
                anchors.horizontalCenter: parent.horizontalCenter // размещение по центру оси OX колонки
                placeholderText: qsTr("Логин")
                color: secondaryFrame.textColor // цвет текста (переменная объявлена выше)
                // onEnterPressed и onReturnPressed – две кнопки Enter на стандартной клавиатуре
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: passwordTextField
                echoMode: TextInput.Password // звездочки вместо пароля
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Пароль")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            Button {
                id: submitButton
                width: 200
                height: 40
                background: Rectangle {
                color: parent.down ? "#bbbbbb" :
                (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                } // разный цвет кнопки при нажатии, наведении курсора и в обычном состоянии
                text: qsTr("Вход")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: checkCredentials()
            }
        }
    }

    Rectangle{
        id: task_2_3
        color: "#bbbbbb"
        anchors.top: secondaryFrame.bottom
        radius: 5 // Закругление углов с выбранным радиусом
        width: primaryFrame.width
        height: 170

        Task_1{ id: calcTask1 }
        GridLayout {
            columns: 4
            rows: 6

            Text{
                text: qsTr("Задание 2")
                Layout.column: 0
                Layout.row: 0
            }
            TextField {
                id: task2_A
                Layout.column: 0
                Layout.row: 1
                placeholderText: qsTr("A")
            }
            TextField {
                id: task2_B
                Layout.column: 1
                Layout.row: 1
                placeholderText: qsTr("B")
            }
            TextField {
                id: task2_C
                Layout.column: 2
                Layout.row: 1
                placeholderText: qsTr("C")
            }
            Button {
                id: task2_button
                Layout.column: 3
                Layout.row: 1
                text: qsTr("Расчет")
                onClicked: {
                    if(task2_A.text == "" || task2_B.text == "" || task2_C.text == "") {
                        result_task2.text = qsTr("Площадь треугольника: нет данных")
                        return;
                    }
                    result_task2.text = calcTask1.getAreaOnSides(task2_A.text, task2_B.text, task2_C.text)
                }
            }
            Text{
                id: result_task2
                text: qsTr("Площадь треугольника: нет данных")
                Layout.column: 0
                Layout.row: 2
            }


            Text{
                text: qsTr("Задание 3")
                Layout.column: 0
                Layout.row: 3
            }
            TextField {
                id: task3_A
                Layout.column: 0
                Layout.row: 4
                placeholderText: qsTr("A")
            }
            TextField {
                id: task3_B
                Layout.column: 1
                Layout.row: 4
                placeholderText: qsTr("B")
            }
            TextField {
                id: task3_C
                Layout.column: 2
                Layout.row: 4
                placeholderText: qsTr("C")
            }
            Button {
                id: task3_button
                Layout.column: 3
                Layout.row: 4
                text: qsTr("Расчет")
                onClicked: {
                    if(task3_A.text == "" || task3_B.text == "" || task3_C.text == "") {
                        result_task3.text = qsTr("Площадь треугольника: нет данных")
                        return;
                    }
                    result_task3.text = calcTask1.getAreaByCoordinates(task3_A.text, task3_B.text, task3_C.text)
                }
            }
            Text{
                id: result_task3
                text: qsTr("Площадь треугольника: нет данных")
                Layout.column: 0
                Layout.row: 5
            }
        }
    }
}
