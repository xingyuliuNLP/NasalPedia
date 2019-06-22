import React from 'react';
import DownloadLink from "react-download-link";
// import soundfile from '../audio/qwsein.wav'
import Sound from 'react-sound';

import { BrowserRouter as Router, Route, Switch, Link } from "react-router-dom";

const Ourdata = () => {
  return (
    <div>

      {/* <DownloadLink
        filename="myfile.txt"
        exportFile={() => "My cached data"}
      >
        Save to disk
      </DownloadLink> */}
      <div className="quote-container">
        <div>  </div>
        <blockquote>Pour embrasser le phénomène complètement, j'ai pris à la fois les divers tracés : de la langue (L), de l'air sortant par le nez, qui nous renseigne sur les mouvements du voile du palais (N), du souffle (S) et de la voix (V).</blockquote>
      </div>


      <h2>Formant Data</h2>
      <h3>Les monophtongues en mandarin</h3>
      <p>- Scripts</p>
      <a href="https://github.com/xiaoouwang/nasalpedia/raw/gh-pages/another.pdf" download>hehe</a> 
      <div class="flex-container">
        <div><img src="" alt=""/></div>

      </div>

      <br />
      {/* <a href="">2nd learner</a> */}
      {/* <Link to="" >Users</Link> */}


      <div style={{ textAlign: "center" }}>Abbe Rousselot 1987</div>

    </div>
  );
}

export default Ourdata;