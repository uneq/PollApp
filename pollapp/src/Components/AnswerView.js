import { useState, useEffect } from 'react';
import '../Style/main.css';
import { BarChart } from '../Components/BarChart';
import { DoughnutChart } from '../Components/DoughnutChart';
import { Doughnut } from 'react-chartjs-2';



export function AnswerView() {
    const [doughnutChart, setDoughnutChart] = useState([]);
    const [text, setText] = useState([]);

    const ApiEndpoint = ["boolean", "scale", "dilemma", "text"];

    useEffect(() => {
        async function fetchData() {

            let questionCollection = []
            let answerCollection = []

            for (let i = 0; i < ApiEndpoint.length; i++) {
                const responseQuestion = await fetch(window.location.origin + '/api/' + ApiEndpoint[i])
                const dataQuestion = await responseQuestion.json(responseQuestion);
                questionCollection.push(dataQuestion);
            }

            for (let i = 0; i < questionCollection.length; i++) {
                for (let j = 1; j < questionCollection[i].length + 1; j++) {
                    const responseAnswer = await fetch(window.location.origin + '/api/' + "getvalues", {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                            'table': ApiEndpoint[i],
                            'id': j
                        }
                    });
                    const dataAnswer = await responseAnswer.json(responseAnswer);
                    if (dataAnswer === null) return;
                    answerCollection.push(dataAnswer);
                }
            }

            let questionIndex = 0;
            let answerIndex = 0;
            let Doughnut = []

            for (let i = 0; i < questionCollection.length - 1; i++) {

                for (let j = 0; j < questionCollection[questionIndex].length; j++) { //
                    Doughnut.push(<DoughnutChart key={questionCollection[questionIndex][j].Question + j} QuestionData={questionCollection[questionIndex][j]} ValueData={answerCollection[answerIndex]}></DoughnutChart>);
                    answerIndex++;
                }

                if (questionIndex + 1 > questionCollection[questionIndex].length) return;

                questionIndex++;
            }

            let textA = [];

            for (let i = 0; i < answerCollection[answerCollection.length - 1].length; i++) {
                textA.push(<div key={"T" + i}>
                    <p>{answerCollection[answerCollection.length - 1][i].Value}</p>
                    <hr></hr>
                </div>);
            }

            setDoughnutChart(Doughnut);
            setText(textA);
        }

        fetchData();
    }, []);

    return (
        <>
            {doughnutChart}
            <div className='Container'>
                <h3>Text Antworten</h3>
                <hr/>
                {text}
            </div>

        </>
    );
}