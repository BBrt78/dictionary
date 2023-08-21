import './App.css';
import {useState, useRef, useEffect, useReducer, createContext, useContext} from 'react';
import axios from "axios";

function App() {
    const [data, setData] = useState({})
    const [word, setWord] = useState("")

    const componentDidMount = (event) => {
        if (event.key === "Enter") {
            axios.get(`https://api.dictionaryapi.dev/api/v2/entries/en/${word}`).then(response => {
            setData(response.data)
            console.log(data[0].phonetics)
            })
        }}

   
    return (
        <div className="container">
            <input 
                type="text"
                className="input" 
                onKeyDown={componentDidMount} 
                value={word} 
                onChange={event => setWord(event.target.value)}
                placeholder="Enter Word"
                />
            <div className="translation">
                <span className="word"></span>
                <span className="example"></span>
            </div>
        </div>
    )
}
export default App;
