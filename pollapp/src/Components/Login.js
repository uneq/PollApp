import { useState } from 'react';
import '../Style/main.css';

export function Login(props) {

    const [btnEnable, setBtnEnale] = useState(false);
    const [codeInput, setCodeInput] = useState("");
    const [message, setMessage] = useState("");
    const [showComponent, setShowComponent] = useState(false);

    async function fetchData() {
        const response = await fetch(process.env.REACT_APP_BACKEND_URL + "isactive", {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'code': codeInput
            }
        });
        const data = await response.json();

        if(data[0] == null) return setMessage("Code ungültig!");
        if(props.isAdmin && data[0].Admin === 0 || !props.isAdmin && data[0].Admin === 1) return setMessage("Falsche Berechtigung!");
        if(!props.isAdmin && data[0].Active === 0) return setMessage("Code bereits verwendet!"); 
        if(!props.isAdmin && data[0].Active === 0) return setShowComponent(true); localStorage.setItem('validCode', codeInput);
        setShowComponent(true); localStorage.setItem('validCode', codeInput);
        deactivateCode();
    }

    async function deactivateCode(){
        const response = await fetch(process.env.REACT_APP_BACKEND_URL + "codes", {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'code': codeInput
            }
        });
    }

    const onValueChange = (event) => {
        if (event.target.value.length === 6) {
            setCodeInput(event.target.value);
            setBtnEnale(true);
        }
        else setBtnEnale(false);
    }

    return (
        <>
            {!showComponent &&
                <div className='Login'>
                    <h2>Gib deinen persönlichen Code ein um fortzufahren!</h2>
                    <div>
                        <input type='text' name='code' placeholder='Dein Code' maxLength="6" onChange={onValueChange}></input>
                        <button disabled={!btnEnable} onClick={fetchData} >Start</button>
                    </div>
                    <p>{message}</p>
                </div>
            }
            {showComponent &&
                <>
                    {props.showComponent}
                </>
            }
        </>
    );
}