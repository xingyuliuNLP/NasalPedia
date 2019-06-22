import React, { Component } from 'react';
// import '../styles/headerStyle.css';
// eslint-disable-next-line
import { NavLink } from "react-router-dom";
// eslint-disable-next-line
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Delvaux from './Delvaux';

class FilterAuthor extends Component {

  render() {
    const upperClass = this.props.match.url;
    console.log(upperClass);

    return (
      // ,backgroundColor: "#c8e6c9"
      <div style={{ textAlign: "center" }}>
        <NavLink to="/about"><span className="chip teal lighten-3 waves-effect waves-orange">Amelot</span></NavLink>
        <NavLink><span className="chip red lighten-3 waves-effect waves-orange">Beddor</span></NavLink>
        <NavLink><span className="chip pink lighten-3 waves-effect waves-orange">Basset</span></NavLink>
        <NavLink><span className="chip purple lighten-3 waves-effect waves-orange">Cohn</span></NavLink>
        <NavLink><span className="chip deep-purple lighten-3 waves-effect waves-orange">Sole</span></NavLink>
        <NavLink><span className="chip indigo lighten-3 waves-effect waves-orange">Rossato</span></NavLink>
        <NavLink><span className="chip blue lighten-3 waves-effect waves-orange">Maeda</span></NavLink>
        <NavLink to="/nasalpedia/byauthor/delvaux"><span className="chip green lighten-3 waves-effect waves-orange">Delvaux</span></NavLink>
        <NavLink to="/nasalpedia/byauthor/delvaux"><span className="chip light-green lighten-3 waves-effect waves-orange">Stevens</span></NavLink>
        <NavLink to="/nasalpedia/byauthor/delvaux"><span className="chip deep-orange lighten-3 waves-effect waves-orange">Rossato</span></NavLink>
        <NavLink to="/nasalpedia/byauthor/delvaux"><span className="chip blue-grey lighten-3 waves-effect waves-orange">Vaissiere</span></NavLink>
        {/* <NavLink to="/byauthor/delvaux"><span className="chip lime waves-effect waves-orange">Delvaux</span></NavLink> */}
      </div>
    );
  }
}

export default FilterAuthor;