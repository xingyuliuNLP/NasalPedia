// import React from 'react';
// import DownloadLink from "react-download-link";
// import soundfile from '../audio/qwsein.wav'
import Sound from 'react-sound';
// import chineseManSimple from '../img/chineseManSimple.png'; // Tell Webpack this JS file uses this image
import { BrowserRouter as Router, Route, Switch, Link } from "react-router-dom";
import React, { Component } from 'react';
import M from "materialize-css";

class Ourdata extends Component {

  componentDidMount() {
    const elems = document.querySelectorAll('.scrollspy');
    // Auto initialize all the things!
    M.ScrollSpy.init(elems, {});
  }
  render() {
    return (
      <div>
        <div className="quote-container">
          <div>  </div>
          <blockquote>Pour embrasser le phénomène complètement, j'ai pris à la fois les divers tracés : de la langue (L), de l'air sortant par le nez, qui nous renseigne sur les mouvements du voile du palais (N), du souffle (S) et de la voix (V).</blockquote>
        </div>
        <div class="row">

          <div class="col hide-on-small-only push-m1 m3 l3">

            <ul className="section table-of-contents pinned">
              <div style={{ height: "100px" }}></div>
              <li><a href="#formant">Formant Data</a></li>
              <li><a href="#structure">Structure</a></li>
              <li><a href="#initialization">Intialization</a></li>
            </ul>
          </div>


          <div class="col s12 m6 l8">
            <div id="formant" class="section scrollspy table-of-contents">
              <br />
              <br />
              <h2>Formant Data</h2>
                <h3>1. Les monophtongues en mandarin</h3>

                <div className="containers">
                  <img src={require('../img/chineseManSimple.png')} alt="hehehe" />
                  <img src={require('../img/chineseManDiphTriph.png')} alt="hehehe" />
                  <img src={require('../img/chineseManDiphArrow0.jpg')} alt="hehehe" />
                  <img src={require('../img/ChineseManDiphArrowIY.jpg')} alt="hehehe" />
                  <img src={require('../img/ChineseManDiphArrowW.jpg')} alt="hehehe" />
                </div>
                <div className="scripts">
                <h4>- Scripts</h4>
                </div>

            </div>

            <div id="structure" class="section scrollspy">
              <p></p>
            </div>

            <div id="initialization" class="flow-test section scrollspy">
              <p></p>
            </div>

          </div>



        </div>






        {/* <a href={Backup} download>hehe</a> */}


      </div >
    );
  }
}

export default Ourdata;