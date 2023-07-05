import Chart from "chart.js/auto";
import { Bar } from 'react-chartjs-2';


export function BarChart(props) {

    const labels = ["Yes","No"];

    const data = {
        labels: labels,
        datasets: [
            {
                label: "Klasse 8",
                backgroundColor: "rgb(20, 186, 142)",
                data: [62]
            },
            {
                label: "Klasse 8",
                backgroundColor: "rgba(20, 114, 186)",
                data: [18]
            },
            {
                label: "Klasse 9",
                backgroundColor: "rgb(20, 186, 142)",
                data: [62]
            },
            {
                label: "Klasse 9",
                backgroundColor: "rgb(20, 114, 186)",
                data: [18]
            },
        ]
    };

    const options = {
        maintainAspectRatio : false,
        plugins: {
            title: {
                display: true,
                text: props.Title
            },
        }
    };

    return (
        <div className="Container" >
            <Bar data={data} options={options} />
        </div >
    );
}