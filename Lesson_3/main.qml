import QtQuick 2.0
import QtCharts 2.0

Item {
    anchors.fill: parent
    property variant othersSlice: 0
    ChartView {
    id: chart
    title: "Top-5 car brand shares in Finland"
    anchors.fill: parent
    legend.alignment: Qt.AlignBottom
    antialiasing: true
    PieSeries {
        id: pieSeries
        PieSlice { label: "Volkswagen"; value: 13.5 }
        PieSlice { label: "Toyota"; value: 10.9 }
        PieSlice { label: "Ford"; value: 8.6 }
        PieSlice { label: "Skoda"; value: 8.2 }
        PieSlice { label: "Volvo"; value: 6.8 }
    } // Доли графика будут рассчитаны автоматически
    }

    Component.onCompleted: {
    // Динамическое добавление данных и выбор слайса, который будет выделен на графике
    othersSlice = pieSeries.append("Others", 52.0);
    pieSeries.find("Volkswagen").exploded = true;
    }
}
