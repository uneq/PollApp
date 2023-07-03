import { Route, Routes } from 'react-router-dom';
import './Style/main.css';

import { Home } from './Pages/Home';

import { AdminConsole } from './Pages/AdminPanel';

function App() {
  return (
    <>
      <Routes>
        <Route path='/' element={<Home />} />
        <Route path='/admin' element={<AdminConsole />} />
      </Routes>
    </>
  );
}

export default App;
