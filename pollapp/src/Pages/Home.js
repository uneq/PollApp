import { Login } from '../Components/Login'
import { Banner } from '../Components/Banner';
import { PollUI } from '../Components/PollUI';

export function Home() {
    return (
        <div className='BackgroundPicture'>
            <Banner headerText='Umfrage zu Diskriminierung an unserer Schule'></Banner>
            <Login showComponent={<PollUI></PollUI>} isAdmin={false}></Login>
        </div>

    );
}

