import '../Style/main.css';
import Logo from '../Content/Logo_Ulrich-von-Hutten-Gymnasium_Schlüchtern.png'

export function Banner(props) {
    return (
        <div className='Banner'>
            <img src={Logo} alt='Logo'></img>
            <h1>{props.headerText}</h1>
        </div>
    );
}