import { useState } from 'react';
import '../Style/main.css';

export function CodesView(props) {

    const [enableCodeView, setCodeView] = useState(true);

    const Class08 = [];
    const Class09 = [];
    const Class10 = [];
    const Class11 = [];
    const Class12 = [];
    const Class13 = [];

    if(props.Codes === undefined) return;

    for (let i = 0; i < props.Codes.length; i++) {

        switch (props.Codes[i].Code.substring(0, 2)) {

            case '08': Class08.push(<h2 key={i} >{props.Codes[i].Code}</h2>); break;

            case '09': Class09.push(<h2 key={i} >{props.Codes[i].Code}</h2>); break;

            case '10': Class10.push(<h2 key={i} >{props.Codes[i].Code}</h2>); break;

            case '11': Class11.push(<h2 key={i} >{props.Codes[i].Code}</h2>); break;

            case '12': Class12.push(<h2 key={i} >{props.Codes[i].Code}</h2>); break;

            case '13': Class13.push(<h2 key={i} >{props.Codes[i].Code}</h2>); break;

            default: return;

        }

    }

    function onValueChange() {
        setCodeView(!enableCodeView);
    }

    return (
        <div className='Container'>

            <h1>Codes Klassenstuffe: {props.Class} </h1>
            <input type="checkbox" id="CodesView" defaultChecked="true" onClick={onValueChange} ></input>
            <label htmlFor='CodesView'>Show Codes</label>
            <hr />

            <div className='ListHorizontal'>

                {enableCodeView &&
                    <>
                        {props.Class === '08' &&
                            <>
                                {Class08}
                            </>
                        }

                        {props.Class === '09' &&
                            <>
                                {Class09}
                            </>
                        }

                        {props.Class === '10' &&
                            <>
                                {Class10}
                            </>
                        }

                        {props.Class === '11' &&
                            <>
                                {Class11}
                            </>
                        }

                        {props.Class === '12' &&
                            <>
                                {Class12}
                            </>
                        }

                        {props.Class === '13' &&
                            <>
                                {Class13}
                            </>
                        }

                        {props.Class === '8 - 13' &&
                            <>
                                {Class08}
                                <div className='break' />
                                {Class09}
                                <div className='break' />
                                {Class10}
                                <div className='break' />
                                {Class11}
                                <div className='break' />
                                {Class12}
                                <div className='break' />
                                {Class13}
                            </>
                        }
                    </>
                }
            </div>

        </div>

    );
}