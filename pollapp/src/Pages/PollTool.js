import { PollUI } from '../Components/PollUI';
import { Banner } from '../Components/Banner';

export function PollTool() {
    return (
        <div className='BackgroundPicture'>
            <Banner headerText='Umfrage zu Diskriminierung an unserer Schule'></Banner>
            <PollUI></PollUI>
        </div>
    );
}
