import Chart from "chart.js/auto";
import { Doughnut } from 'react-chartjs-2';

export function DoughnutChart(props) {

    let labels = [];
    let value = [];

    const valueRaw = [];
    let dataOptions = [];

    for (let i = 0; i < props.ValueData.length; i++) {
        valueRaw.push(props.ValueData[i].Value);
    }

    const key = Object.keys(props.QuestionData)[2];

    let map = valueRaw.reduce(function (prev, cur) {
        prev[cur] = (prev[cur] || 0) + 1;
        return prev;
    }, {});

    if (key === "Options") {
        dataOptions = JSON.parse(props.QuestionData[key]);

        for (let i = 0; i < dataOptions.length; i++) {
            labels.push(dataOptions[i]);
            value.push(map[i]);
        }

    }
    else {
        labels = ["Ja", "Nein"];
        value = [map[1],map[0]];
    }

    const data = {
        labels: labels,
        datasets: [
            {
                label: "Stimmen Gesamt",
                /* backgroundColor: [
                     "rgba(20, 114, 186)",
                     "rgb(20, 186, 142)"
                 ],
    */
                hoverOffset: 5,
                data: value
            },
        ]
    };

    const options = {
        maintainAspectRatio: false,
        plugins: {
            title: {
                display: true,
                text: props.QuestionData.Question
            },
        }
    };

    return (
        <div className="Container" >
            <Doughnut data={data} options={options} />
        </div >
    );
}