import { useState, useEffect } from 'react';
import '../Style/main.css';

export function PollUI() {

    const [questionType, setQuestionType] = useState(0);
    const [questionIndex, setQuestionIndex] = useState(0);
    const [question, setQuestion] = useState([]);
    const ApiEndpoint = ["boolean", "scale", "dilemma", "text"];

    const [optionSelector, setOptionSelector] = useState([]);
    const [definition, setDefinition] = useState([]);

    const [answerValue, setAnswerValue] = useState(null);
    const [btnYesTheme, setBtnYesTheme] = useState("");
    const [btnNoTheme, setBtnNoTheme] = useState("");

    const [finished, setFinished] = useState(false);

    useEffect(() => {
        async function fetchData() {

            let questionCollection = [];

            for (let i = 0; i < ApiEndpoint.length; i++) {
                const response = await fetch(window.location.origin + '/api/' + ApiEndpoint[i])
                const data = await response.json(response);
                questionCollection.push(data);
            }
            setQuestion(questionCollection);
        }

        fetchData();
    }, []);

    useEffect(() => {
        setAnswerValue(null);
        setBtnYesTheme("");
        setBtnNoTheme("");

        getDefinition();

        if (questionType === 1) {
            setAnswerValue(0);
        }

        if (questionType === 2) {

            const options = JSON.parse(question[questionType][questionIndex].Options);

            let elements = [];

            for (let i = 0; i < options.length; i++) {
                console.log(options[i]);
                elements.push(
                    <div key={"O" + i}>
                        <input type="radio" id={i} name='OptionSelector' onChange={onRadioButtonSelected}></input>
                        <label htmlFor={i}>{options[i]}</label>
                    </div>
                );
            }

            setOptionSelector(elements);
        }

    }, [questionIndex]);

    useEffect(() => {
        getDefinition();
    }, [question]);

    async function getDefinition() {

        if (question.length < 1) return;

        if (question[questionType][questionIndex].Definition_ID === undefined) return;

        const response = await fetch(window.location.origin + '/api/definition', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'id': question[questionType][questionIndex].Definition_ID
            }
        });

        const data = await response.json(response);
        setDefinition(data);
    }

    function btnYesNo(type) {
        setAnswerValue(type);
        if (type === 0) {
            setBtnNoTheme("btnPressed");
            setBtnYesTheme("");
            setAnswerValue("0");
        }
        else {
            setBtnYesTheme("btnPressed");
            setBtnNoTheme("");
            setAnswerValue("1");
        }
    }

    async function writeAnswer(value) {
        const key = Object.keys(question[questionType][questionIndex])[0];

        const response = await fetch(window.location.origin + '/api/writevalues', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                'table': ApiEndpoint[questionType],
                'code': localStorage.getItem('validCode'),
                'questionID': question[questionType][questionIndex][key],
                'value': value
            })
        });

    }

    function onValueChange(event) {
        setAnswerValue(event.target.value);
    }

    function onRadioButtonSelected(event) {
        setAnswerValue(event.target.id);
    }

    function onTextChange(event) {
        setAnswerValue(event.target.value.replace("'",""));
        
    }

    function btnContinue() {

        const type = questionType;
        console.log("click")

        if (answerValue == null) return;
        writeAnswer(answerValue);

        if (questionIndex + 1 === question[type].length) {
            setQuestionIndex(0);
            if (type + 1 === question.length) return setFinished(true);
            setQuestionType(type + 1);
            return
        }

        setQuestionIndex(questionIndex + 1);
    }

    return (
        <div className='PollUI'>
            {(question.length >= 1 && !finished) &&
                <>

                    {definition.length >= 1 &&
                        <div className='Container'>
                            <h3>{definition[0].Caption}</h3>
                            <p>{definition[0].Definition}</p>
                        </div>
                    }

                    <h2>{question[questionType][questionIndex].Topic}</h2>
                    <hr></hr>
                    <h1>{question[questionType][questionIndex].Question}</h1>

                    {questionType === 0 && //Kat 1+2 Eigene Einschätzung & eigene Erfahrung
                        <>
                            <button className={btnYesTheme} onClick={() => btnYesNo(1)}>Ja</button>
                            <button className={btnNoTheme} onClick={() => btnYesNo(0)}>Nein</button>
                        </>
                    }

                    {questionType === 1 && //Kat 3 
                        <>
                            <input key={questionIndex} type='range' min='0' max='9' step='1' defaultValue="0" onChange={onValueChange}></input>
                            <div className='valueBar'>
                                <h2>0</h2>
                                <h2>1</h2>
                                <h2>2</h2>
                                <h2>3</h2>
                                <h2>4</h2>
                                <h2>5</h2>
                                <h2>6</h2>
                                <h2>7</h2>
                                <h2>8</h2>
                                <h2>9</h2>
                            </div>
                        </>
                    }

                    {questionType === 2 && //Kat 4 
                        <fieldset key={questionIndex}>
                            <legend>Wähle aus!</legend>
                            {optionSelector}
                        </fieldset>
                    }

                    {questionType === 3 && //Kat 5
                        <textarea onChange={onTextChange}></textarea>
                    }

                    <button id='continue' onClick={btnContinue}>Weiter</button>
                </>
            }

            {
                finished &&
                <h1>Danke für deine Teilnahme! Du kannst dieses Fenster schließen.</h1>
            }
        </div >
    );
}