import './App.css';
import React, {useState, useRef, useEffect, useReducer, createContext, useContext} from 'react';
import axios from "axios";

function App() {
    const [data, setData] = useState({})
    const [word, setWord] = useState("")

    useEffect(() => {
        if (word && word.trim !== "") {
            axios.get(`https://api.dictionaryapi.dev/api/v2/entries/en/${word}`)
            .then(response => {setData(response.data)})
            .catch(error => {console.error("error: ", error)})
        }
    }, [word]);

    const handleKeyDown = (event) => {
        if (event.key === "Enter") {
            if (word && word.trim() !== "") {
                axios.get(`https://api.dictionaryapi.dev/api/v2/entries/en/${word}`)
                .then(response => {
                    setData(response.data)
                    console.log(response.data)
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
            }
        }
    }
   
    return (
        <div className="container">
            <input 
                type="text"
                className="input" 
                onKeyDown={handleKeyDown} 
                value={word} 
                onChange={event => setWord(event.target.value)}
                placeholder="Enter Word"
                />
            <div className="translation">
                {data[0] ?(
                    <div>
                        <p className="word">{data[0].word}</p>
                        <p className="meaning">{data[0].meanings[0].definitions[0].definition}</p>
                        <p className="meaning">
                        {data[0].meanings[1] && data[0].meanings[1].definitions[0] ? data[0].meanings[1].definitions[0].definition : <div></div>}</p>
                    </div>
                    ) : (<div></div>)
                }
            </div>
        </div>
    )
}
export default App;
