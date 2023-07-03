import { Login } from '../Components/Login';
import { Banner } from '../Components/Banner';
import { AdminUI } from '../Components/AdminUI';

export function AdminConsole(){

    return (
        <>
            <Banner headerText='Umfrage Administrator Console'></Banner>
            <Login showComponent={<AdminUI></AdminUI>} isAdmin={true}></Login>
        </>
    );
}