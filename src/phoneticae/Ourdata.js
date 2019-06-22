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
              <li><a href="#etude1">Acoustique des voyelles en mandarin</a></li>
              <li><a href="#etude2">Acoustique des voyelles en français</a></li>
              <li><a href="#etude3">Données de la station EVA2</a></li>
              <li><a href="#etude4">Données d'accéléromètre piézoélectrique (AP)</a></li>
            </ul>
          </div>


          <div class="col s12 m6 l8">
            <div>
              <br />
              <br />
              <h2>Formant Data</h2>
              <h3 id="etude1" class="section scrollspy table-of-contents">Etude 1. Acoustique des voyelles en mandarin </h3>
              <h4>- Scripts</h4>
              <div className="scripts">
                <ul className="list">
                  <li> <i class="tiny material-icons">device_hub</i>  
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r1SpecroGraphChineseSimple.R">r1SpecroGraphChineseSimple.R</a></li>
                  <li> <i class="tiny material-icons">device_hub</i> 
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r2SpectroGraphChineseDiphTriph.R">r2SpectroGraphChineseDiphTriph.R</a></li>
                  <li> <i class="tiny material-icons">device_hub</i> 
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r3chineseVowelsArrow.R">r3chineseVowelsArrow.R</a></li>

                </ul>
              </div>
              <h4>- Données</h4>
              <div className="donnees">
                <ul className="list">
                 <li> <i class="tiny material-icons">equalizer</i>  
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r1SpecroGraphChineseSimple.R">r1SpecroGraphChineseSimple.R</a></li> 
                </ul>

            

              </div>
             <h4>- Graphiques</h4> 
              <div className="containers">
                <img src={require('../img/chineseManSimple.png')} alt="hehehe" />
                <img src={require('../img/chineseManDiphTriph.png')} alt="hehehe" />
                <img src={require('../img/chineseManDiphArrow0.jpg')} alt="hehehe" />
                <img src={require('../img/ChineseManDiphArrowIY.jpg')} alt="hehehe" />
                <img src={require('../img/ChineseManDiphArrowW.jpg')} alt="hehehe" />
              </div>




            </div>

            <div id="structure" class="section scrollspy">
              <h3 id="etude2" class="section scrollspy table-of-contents">Etude 2. Acoustique des voyelles en français </h3>
              <h4>- Scripts</h4>
              <div className="scripts">
                <ul>
                  <li><i class="tiny material-icons">device_hub</i> 
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r4SpectroGraphFrenchSimple.R">r4SpectroGraphFrenchSimple.R</a></li>
                  <li><i class="tiny material-icons">equalizer</i> 
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r5TotalFemmeTriangle.R">r5TotalFemmeTriangle.R</a></li> 
                  <li></li>
                  <li></li>
                </ul>
              </div>
            </div>

            <div id="initialization" class="flow-test section scrollspy">
              
            </div>

          </div>



        </div>






        {/* <a href={Backup} download>hehe</a> */}


      </div >
    );
  }
}

export default Ourdata;