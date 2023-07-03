import { useState, useEffect, useCallback } from 'react';
import { Login } from '../Components/Login';
import { Banner } from '../Components/Banner';
import { GenerateCodeSet } from '../HelperFunctions/CodeGenerator';
import { CodesView } from '../Components/CodesView';
import { AnswerView } from './AnswerView';

export function AdminUI() {

    const [codeGeneratorDisable, setCodeGeneratorDisable] = useState(true);
    const [codes, setCodes] = useState([]);
    const [amountNewCodes, setAmountNewCodes] = useState(0);
    const [classSelected, setClassSelected] = useState(6);
    const [classSelectedMessage, setClassSelectedMessage] = useState("Neue Codes generieren: Deaktiviert");

    const classArray = ["08", "09", "10", "11", "12", "13", "8 - 13"];
    const utc = new Date().toLocaleString();

    useEffect(() => {
        fetchData();
    }, [classSelected]);

    async function fetchData() {
        const response = await fetch(process.env.REACT_APP_BACKEND_URL + "codes");
        const data = await response.json();
        setCodes(data);
    }

    function getActiveCodeNumber() {
        var CodesCount = 0;
        for (let i = 0; i < codes.length; i++) {
            if (codes[i].Active === 1) CodesCount++;
        }
        return CodesCount;
    }

    function onValueChange(event) {

        setClassSelected(event.target.value);

        if (event.target.value === "6") {
            setClassSelectedMessage("Neue Codes generieren: Deaktiviert");
            setCodeGeneratorDisable(true);
        }
        else {
            setClassSelectedMessage("Neue Codes für Klassenstufe: " + classArray[event.target.value] + " generieren");
            setCodeGeneratorDisable(false);
        }
    }

    function getCodeAmount(event) {
        setAmountNewCodes(event.target.value);
    }

    async function GenerateCode() {
        if (amountNewCodes === 0) return;

        const newCodes = GenerateCodeSet(classArray[classSelected], codes, 4, amountNewCodes);

        const response = await fetch(process.env.REACT_APP_BACKEND_URL + "codes", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                'codes': newCodes
            })
        });

        if (response.status === 200) fetchData();
    }

    return (

        <>
            <div className='Container'>
                <h1>Codes Gesamt: {codes.length - 1}</h1>
                <h1>Teilnahmen: {codes.length - getActiveCodeNumber() - 1}</h1>
            </div>

            <div className='Container'>
                <h1>Klassenstufe</h1>
                <input type='range' min='0' max='6' step='1' defaultValue="6" onChange={onValueChange}></input>
                <div className='valueBar'>
                    <h2>08</h2>
                    <h2>09</h2>
                    <h2>10</h2>
                    <h2>11</h2>
                    <h2>12</h2>
                    <h2>13</h2>
                    <h2>All</h2>
                </div>
            </div>

            <div className='Container'>
                <h1>{classSelectedMessage}</h1>
                <input disabled={codeGeneratorDisable} type='number' name='Anzahl' placeholder='Anzahl' onChange={getCodeAmount}></input>
                <button disabled={codeGeneratorDisable} onClick={GenerateCode}>Generieren</button>
            </div>

            <CodesView Codes={codes} Class={classArray[classSelected]} ></CodesView>

            <AnswerView></AnswerView>

            <div className='Container'>
                <p>Page Rendered: {utc}</p>
            </div>
            <br />
        </>

    );
}