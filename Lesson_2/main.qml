import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Window {
    id: primaryFrame
    width: 400
    height: 800
    visible: true
    title: qsTr("Register form")
    color: "#e5ecef"

    // Javascript-функция для проверки данных
    function checkCredentials() {
        if (nameTextField.text === "" ||
            genderTextField.text === "" ||
            ageTextField.text === "" ||
            educationTextField.text === "" ||
            hobbyTextField.text === "" ||
            cityTextField.text === "" ||
            aboutTextField.text === "" ||
            wantAgeTextField.text === "" ||
            wantGenderTextField.text === "" ||
            wantEducationTextField.text === "")
            failAnimation.start()
        else{
            successAnimation.start()
            console.log("Имя---------> " + nameTextField.text);
            console.log("Пол---------> " + genderTextField.text);
            console.log("Возраст-----> " + ageTextField.text);
            console.log("Образование-> " + educationTextField.text);
            console.log("Хобби-------> " + hobbyTextField.text);
            console.log("Город-------> " + cityTextField.text);
            console.log("О себе------> " + aboutTextField.text);
            console.log("Взр. прт.---> " + wantAgeTextField.text);
            console.log("Пол прт.----> " + wantGenderTextField.text);
            console.log("Обрз. прт.--> " + wantEducationTextField.text);
        }

    }

    ParallelAnimation {
        id: failAnimation
        SequentialAnimation {
            // Группа анимаций внутри SequentialAnimation будет выполнена последовательно
            PropertyAnimation {
                targets: [nameTextField, genderTextField, ageTextField, educationTextField,
                          hobbyTextField, cityTextField, aboutTextField, wantAgeTextField,
                          wantGenderTextField, wantEducationTextField]
                property: "color"
                to: "dark red"
                duration: 0
            }
            PropertyAnimation {
                // После этого за 400 миллисекунд вернется к обычному цвету
                targets: [nameTextField, genderTextField, ageTextField, educationTextField,
                          hobbyTextField, cityTextField, aboutTextField, wantAgeTextField,
                          wantGenderTextField, wantEducationTextField]
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
            targets: [nameTextField, genderTextField, ageTextField, educationTextField,
                      hobbyTextField, cityTextField, aboutTextField, wantAgeTextField,
                      wantGenderTextField, wantEducationTextField, submitButton]
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
        anchors.centerIn: parent
        radius: 5 // Закругление углов с выбранным радиусом
        width: 300
        height: 700
        property string textColor: "#535353" // Вынесение общих данных для дочерних элементов в переменную

        Column { // аналог QVBoxLayout
            anchors.fill: parent // объект занимает все пространство родителя
            padding: 16 // отступы по 4 сторонам от родительского элемента
            spacing: 16 // отступы между элементами

            Label{
                text: qsTr("Информация о себе")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: nameTextField
                anchors.horizontalCenter: parent.horizontalCenter // размещение по центру оси OX колонки
                placeholderText: qsTr("Имя")
                color: secondaryFrame.textColor // цвет текста (переменная объявлена выше)
                // onEnterPressed и onReturnPressed – две кнопки Enter на стандартной клавиатуре
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: genderTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Пол")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: ageTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Возраст")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: educationTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Образование")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: hobbyTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Хобби")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: cityTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Город")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: aboutTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("О себе")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            Label{
                text: qsTr("Параметры для поиска партнёра")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: wantAgeTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Желаемый возраст партнера")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: wantGenderTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Желаемый пол")
                color: secondaryFrame.textColor
                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }

            TextField {
                id: wantEducationTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Желаемое образование")
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
                text: qsTr("Регистрация")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: checkCredentials()
            }
        }
    }
}
