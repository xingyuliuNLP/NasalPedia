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

          <blockquote>Pour embrasser le phénomène complètement, j'ai pris à la fois les divers tracés : de la langue (L), de l'air sortant par le nez, qui nous renseigne sur les mouvements du voile du palais (N), du souffle (S) et de la voix (V).</blockquote>
        </div>
        <div class="row">

          <div class="col hide-on-small-only push-m1 m3 l3">

            <ul className="section table-of-contents pinned">
              <div style={{ height: "100px" }}></div>
              <li><a href="#etude1">1. Acoustique des voyelles en mandarin</a></li>
              <li><a href="#etude2">2. Acoustique des voyelles en français</a></li>
              <li><a href="#etude3">3. Données de la station EVA2</a></li>
              <li><a href="#etude4">4. Données d'accéléromètre piézoélectrique (AP)</a></li>
              <li><a href="#etude5">5. Données d'AP et micronasal</a></li>
            </ul>
          </div>

          <div class="col s12 m6 l8">
            <div>
              <br />
              <br />
              <h2>Formant Data</h2>
              <h3 id="etude1" class="section scrollspy table-of-contents">Etude 1. Acoustique des voyelles en mandarin </h3>
              <h4>- Scripts</h4>
              <div className="donnees">
                <ul className="list">
                  <li> <i class="tiny material-icons">device_hub</i>
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r1SpecroGraphChineseSimple.R" target="_blank">r1SpecroGraphChineseSimple.R</a></li>
                  <li> <i class="tiny material-icons">device_hub</i>
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r2SpectroGraphChineseDiphTriph.R" target="_blank">r2SpectroGraphChineseDiphTriph.R</a></li>
                  <li> <i class="tiny material-icons">device_hub</i>
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r3chineseVowelsArrow.R" target="_blank">r3chineseVowelsArrow.R</a></li>

                </ul>
              </div>
              <h4>- Données</h4>
              <div className="donnees">
                <ul className="list">
                  <li> <i class="tiny material-icons">equalizer</i>
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/chineseManSimpleVowels.csv" target="_blank">chineseManSimpleVowels.csv</a></li>
                  <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/chineseManDiphTriph.csv" target="_blank">chineseManDiphTriph.csv</a></li>
                  <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/chineseDiphtonguesManArrow.txt" target="_blank">chineseDiphtonguesManArrow.txt</a></li>
                </ul>



              </div>
              <h4>- Graphiques</h4>
              <div className="containers">
                <img src={require('../img/chineseManSimple.png')} alt="hehehe" />
                <img src={require('../img/chineseManDiphTriph.png')} alt="hehehe" />
                <img src={require('../img/chineseManDiphArrow0.jpg')} alt="hehehe" />
                <img src={require('../img/ChineseManDiphArrowIY.jpg')} alt="hehehe" />
                <img src={require('../img/ChineseManDiphArrowW.jpg')} alt="hehehe" />
                <img src={require('../img/ChineseManDiphArrowAll.jpg')} alt="hehehe" />
              </div>
            </div>

            <div>
              <h3 id="etude2" class="section scrollspy table-of-contents">Etude 2. Acoustique des voyelles en français </h3>
              <h4>- Scripts</h4>
              <div className="donnees">
                <ul>
                  <li><i class="tiny material-icons">device_hub</i>
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r4SpectroGraphFrenchSimple.R" target="_blank">r4SpectroGraphFrenchSimple.R</a></li>
                  <li><i class="tiny material-icons">device_hub</i>
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r5TotalFemmeTriangle.R" target="_blank">r5TotalFemmeTriangle.R</a></li>
                  <li><i class="tiny material-icons">device_hub</i>
                    <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r6DiphFrenchWomenLearners.R" target="_blank">r6DiphFrenchWomenLearners.R</a></li>

                </ul>
              </div>
              <h4>- Données</h4>
              <div className="donnees">
                <ul>
                  <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/frenchManSimpleVowels.csv" target="_blank">frenchManSimpleVowels.csv</a></li>
                  <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/formantChineseFrench1.txt" target="_blank">formantChineseFrench1.txt</a></li>
                  <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/diphWomenLearnerFrench.txt" target="_blank">diphWomenLearnerFrench.txt</a></li>
                </ul>
              </div>
              <h4>- Graphiques</h4>
              <div className="containers">
                <img src={require('../img/frenchManSimple.png')} alt="hehehe" />
                <img src={require('../img/ChineseFrenchFormants5Women.jpg')} alt="hehehe" />
                <img src={require('../img/diphChineseWomenLearners.jpg')} alt="hehehe" />

              </div>
              <div>
                <h3 id="etude3" class="section scrollspy table-of-contents">Etude 3. Données de la station EVA2 </h3>
                <h4>- Scripts</h4>
                <div className="donnees">
                  <ul>
                    <li><i class="tiny material-icons">device_hub</i>
                      <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r8eva.R" target="_blank">r8eva.R</a></li>


                  </ul>
                </div>
                <h4>- Données</h4>
                <div className="donnees">
                  <ul>
                    <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/evaSpeed1.txt" target="_blank">evaSpeed1.txt</a></li>
                    <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/evaSpeed2.txt" target="_blank">evaSpeed2.txt</a></li>
                    <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/evaPvn2speed.txt" target="_blank">evaPvn2speed.txt</a></li>
                  </ul>
                </div>
                <h4>- Graphiques</h4>
                <div className="containers">
                  <img src={require('../img/evaspeed1.png')} alt="hehehe" />
                  <img src={require('../img/evaspeed2.png')} alt="hehehe" />
                  <img src={require('../img/evaPvN2Speed.png')} alt="hehehe" />

                </div>
                <div>
                  <h3 id="etude4" class="section scrollspy table-of-contents">Etude 4. Données d'accéléromètre piézoélectrique (AP)</h3>
                  <h4>- Scripts</h4>
                  <div className="donnees">
                    <ul>
                      <li><i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r9piezoStat.R" target="_blank">r9piezoStat.R</a></li>
                      <li><i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r10piezo.R" target="_blank">r10piezo.R</a></li>
                      <li><i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/statisticTest.R">statisticTest.R</a></li>

                    </ul>
                  </div>
                  <h4>- Données</h4>
                  <div className="donnees">
                    <ul>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/dataall_lent_combined_piezo.txt" target="_blank">dataall_lent_combined_piezo.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/dataall_normal_combined_piezo.txt" target="_blank">dataall_normal_combined_piezo.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacn_lent_combined_piezo.txt" target="_blank">datacn_lent_combined_piezo.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacn_lent_group1.txt" target="_blank">datacn_lent_group1.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacn_lent_group2.txt" target="_blank">datacn_lent_group2.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacn_normal_combined_piezo.txt" target="_blank">datacn_normal_combined_piezo.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacn_normal_group1.txt" target="_blank">datacn_normal_group1.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacn_normal_group2.txt" target="_blank">datacn_normal_group2.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacnfr_lent_combined.txt" target="_blank">datacnfr_lent_combined.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacnfr_lent_group1.txt" target="_blank">datacnfr_lent_group1.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacnfr_lent_group2.txt" target="_blank">datacnfr_lent_group2.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacnfr_normal_combined.txt" target="_blank">datacnfr_normal_combined.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacnfr_normal_group1.txt" target="_blank">datacnfr_normal_group1.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datacnfr_normal_group2.txt" target="_blank">datacnfr_normal_group2.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datafr_lent.txt" target="_blank">datafr_lent.txt</a></li>
                      <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/datafr_normal.txt" target="_blank">datafr_normal.txt</a></li>
                    </ul>
                  </div>
                  <h4>- Graphiques</h4>
                  <div className="containers">
                    <img src={require('../img/dataall_lent_combined_piezo.png')} alt="hehehe" />
                    <img src={require('../img/dataall_normal_combined_piezo.png')} alt="hehehe" />
                    <img src={require('../img/datacn_lent_combined_piezo.png')} alt="hehehe" />
                    <img src={require('../img/datacn_lent_combined_piezo_seperateAnayl.png')} alt="hehehe" />
                    <img src={require('../img/datacn_normal_combined_piezo.png')} alt="hehehe" />
                    <img src={require('../img/datacn_normal_combined_piezo_seperateAnayl.png')} alt="hehehe" />
                  </div>
                  <div className="containers">
                    <img src={require('../img/cnfr_lent.jpg')} alt="hehehe" />
                    <img src={require('../img/cnfr_normal.jpg')} alt="hehehe" />
                    <img src={require('../img/datacn_lent_group1_distri.jpg')} alt="hehehe" />
                    <img src={require('../img/datacn_lent_group2_distri.jpg')} alt="hehehe" />
                    <img src={require('../img/datacn_normal_group1_distri.jpg')} alt="hehehe" />
                    <img src={require('../img/datacn_normal_group2_distri.jpg')} alt="hehehe" />
                    <img src={require('../img/datafr_lent1.jpg')} alt="hehehe" />
                    <img src={require('../img/datafr_lent2.jpg')} alt="hehehe" />
                    <img src={require('../img/datafr_normal.jpg')} alt="hehehe" />
                  </div>
                  <h3 id="etude5" class="section scrollspy table-of-contents">Etude 5. Données d'accéléromètre piézoélectrique (AP) et micronasal </h3>
                  <h4>- Scripts</h4>
                  <div className="donnees">
                    <ul className="list">
                      <li> <i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/praat1ExtractRms.praat">praat1ExtractRms.praat</a></li>
                      <li> <i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/praat1logFormant.praat" target="_blank">praat1logFormant.praat</a></li>
                      <li> <i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/praat2GetRmsCurve.praat" target="_blank">praat2GetRmsCurve.praat</a></li>
                      <li> <i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/praat3MarkNasality.praat" target="_blank">praat3MarkNasality.praat</a></li>
                      <li> <i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/praat3MovebyN.praat" target="_blank">praat3MovebyN.praat</a></li>
                      <li> <i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/praat4durationCH.praat" target="_blank">praat4durationCH.praat</a></li>
                      <li> <i class="tiny material-icons">device_hub</i>
                        <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/scripts/r12microNasal.R" target="_blank">r12microNasal.R</a></li>

                    </ul>
                  </div>
                </div>
                <h4>- Données</h4>
                <div className="donnees">
                  <ul className="list">
                    <li> <i class="tiny material-icons">equalizer</i>
                      <a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/durationCN.csv" target="_blank">durationCN.csv</a></li>
                    <li> <i class="tiny material-icons">equalizer</i><a href="https://github.com/xingyuliuNLP/NasalPedia/blob/master/datafiles/durationcnFR.csv" target="_blank">durationcnFR.csv</a></li>
                  
                  </ul>



                </div>
                <h4>- Graphiques</h4>
                <div className="containers">
                  <img src={require('../img/cnCnfr.jpg')} alt="hehehe" />
                  <img src={require('../img/cnfrFr.jpg')} alt="hehehe" />
                  <img src={require('../img/hehe.png')} alt="hehehe" />
                  <img src={require('../img/cnfrMicroNasalPercent.png')} alt="hehehe" />
                  <img src={require('../img/cnMicroNasalPercent.png')} alt="hehehe" />
                  <img src={require('../img/cnfrMicroNasalAbsolute.png')} alt="hehehe" />
                  <img src={require('../img/cnMicroNasalAbsolute.png')} alt="hehehe" />
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      // </div>


      // </div>

    );
  }
}

export default Ourdata;