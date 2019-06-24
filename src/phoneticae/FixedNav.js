// use router here
import React, { Component } from 'react';
// import M from "materialize-css";

import { BrowserRouter as Router, Route, Switch, NavLink } from "react-router-dom";
import FilterAuthor from './FilterAuthor';
import Ourdata from './Ourdata';
import Delvaux from './Delvaux';
import Vaissiere from './Vaissiere';
import Amelot from "./Amelot";
import Beddor from "./Beddor";
import Basset from "./Basset";
import Cohn from "./Cohn";
import Maeda from "./Maeda";
import Rossato from "./Rossato";
import Sole from "./Sole";
import Stevens from "./Stevens";


class FixedNav extends Component {
  // componentDidMount() {
  //   const side = document.querySelectorAll('.sidenav');
  //   // Auto initialize all the things!
  //   M.Sidenav.init(side, {});
  // }
  // const brand = document.querySelector(".brand-logo");
  //   console.log(window.matchMedia("(max-width:700px").matches);
  //   console.log(window.innerWidth);
  //   if (!window.matchMedia("(max-width: 700px)".matches))
  //     {
  //     brand.className = brand.className.replace(/\bcenter\b/g, "left");
  //     brand.className = brand.className.replace(/\bleft\b/g, "center");
  //     } else {
  //     }
  // }
  render() {
    return (
      <Router>
        <div class="navbar-fixed">
          <nav class="green lighten-4">
            <div class="nav-wrapper">
              <div class="brand-logo" style={{ textAlign: "center" }}><NavLink to="/nasalpedia"><span className="chip green lighten-4 waves-effect waves-white" style={{ fontSize: "25px" }}>NasalPedia</span></NavLink></div>
              {/* <div className="sidenav-trigger" data-target="mobile-demo"><NavLink to = "/"><span className="chip">ClickHere</span></NavLink></div> */}
              {/* hide-on-med-and-down */}
              <ul id="nav-mobile" class="right">
                <li><NavLink to="/nasalpedia/ourdata"><span className="chip amber lighten-3 waves-effect waves-red">Our data<span class="new badge #e0e0e0" data-badge-caption="">5</span></span></NavLink></li>
                <li><NavLink to="/nasalpedia/phonology"><span className="chip amber lighten-3  waves-effect waves-red">Phonetics</span></NavLink></li>
                <li><NavLink to="/phonology"><span className="chip amber lighten-3  waves-effect waves-red">Phonology</span></NavLink></li>
                <li><NavLink to="/nasalpedia/byauthor"><span className="chip amber lighten-3  waves-effect waves-red">Authors<span class="new badge #e0e0e0 " data-badge-caption="">10</span></span></NavLink></li>
                <li><NavLink to="/bylanguage"><span className="chip amber lighten-3 waves-effect waves-red">Languages<span class="new badge #e0e0e0" data-badge-caption="">6</span></span></NavLink></li>
                <li><NavLink to="/bydatatype"><span className="chip amber lighten-3 waves-effect waves-red">DataTypes<span class="new badge #e0e0e0" data-badge-caption="">3</span></span></NavLink></li>
                <li><NavLink to="/phonology"><span className="chip amber lighten-3 waves-effect waves-red">Learners<span class="new badge #e0e0e0" data-badge-caption="">3</span></span></NavLink></li>
              </ul>
              <br />

              <Route path="/nasalpedia/byauthor/" component={FilterAuthor} />
              {/* <Route path="/nasalpedia/ourdata/" component={Delvaux} /> */}
            </div>
          </nav>

        </div>
        <Route exact path="/nasalpedia/" component={Ourdata} />
        {/* nav end */}
        <Route path="/nasalpedia/byauthor/delvaux" component={Delvaux} />
        <Route path="/nasalpedia/byauthor/vaissiere" component={Vaissiere} />
        <Route path="/nasalpedia/byauthor/amelot" component={Amelot} />
        <Route path="/nasalpedia/byauthor/beddor" component={Beddor} />
        <Route path="/nasalpedia/byauthor/basset" component={Basset} />
        <Route path="/nasalpedia/byauthor/cohn" component={Cohn} />
        <Route path="/nasalpedia/byauthor/maeda" component={Maeda} />
        <Route path="/nasalpedia/byauthor/rossato" component={Rossato} />
        <Route path="/nasalpedia/byauthor/sole" component={Sole} />
        <Route path="/nasalpedia/byauthor/stevens" component={Stevens} />
        <Route path="/nasalpedia/ourdata/" component={Ourdata} />

      </Router>
    )
  }
}

export default FixedNav;