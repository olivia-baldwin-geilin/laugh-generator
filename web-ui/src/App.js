import React, { useState } from "react";
import './App.css';
import Button from '@mui/material/Button'

function App() {
  const [joke, setJoke] = useState("No Joke Yet")

  const get_joke = async () => {
      fetch('http://0.0.0.0:5000/random_joke', {
          method: 'GET'
      })
      .then((response) => response.json())
      .then((data) => {
          console.log('Successs: ', data);
          setJoke(data[0].body)
      })
      .catch((error) => {
          console.error('Error: ', error);
      });
  }

  return (
    <div className="App">
      <header className="App-header">
        <div className="joke-button">
          <Button onClick={get_joke} color="secondary" variant="contained">Make Me Laugh</Button>
        </div>
        <div className="joke">
            {joke}
        </div>
      </header>
    </div>
  );
}

export default App;
