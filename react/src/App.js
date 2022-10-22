import {useEffect,useState,useCallback} from 'react'
import logo from './logo.svg';
import './App.css';
import axios from 'axios';

axios.defaults.baseURL = 'http://localhost:3001'

function App() {
  const [articles,setArticles] = useState([])
  useEffect(()=>{
    const fetchData = async ()=>{
      const data = await axios.get('/articles')
      console.log(data)
      setArticles(data['data'])
    }
    fetchData()
  },[])

  const handleSendData = useCallback(async ()=>{
    const article = {title:'React POST Request Example', content:'Sample'}
    axios.post('/articles',article)
    const data = await axios.get('/articles')
    setArticles(data['data'])
  },[])
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>

      <div>
        <p>{JSON.stringify(articles)}</p>
        <button onClick={handleSendData}>Create Random Data</button>
      </div>
    </div>
  );
}

export default App;
