import './App.css';
import {useState, useRef, useEffect, useReducer, createContext, useContext} from 'react';
import axios from "axios";

function App() {
    const [data, setData] = useState({})
    const [word, setWord] = useState("")

    useEffect(() => {
        axios.get(`https://api.dictionaryapi.dev/api/v2/entries/en/hello`)})

    const componentDidMount = (event) => {
        if (event.key === "Enter") {
            axios.get(`https://api.dictionaryapi.dev/api/v2/entries/en/${word}`).then(response => {
            setData(response.data)
            console.log(response.data)
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
                <span className="word">{data && data[0] ? data[0].word : null}</span>
                <span className="example"></span>
            </div>
        </div>
    )
}
export default App;
