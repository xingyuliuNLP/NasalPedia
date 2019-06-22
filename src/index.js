import React, { Component } from 'react';
import ReactDOM from 'react-dom';
// import Vaissiere from './phoneticae/Vaissiere.json';
// eslint-disable-next-line
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import ScrollUpButton from "react-scroll-up-button"; //Add this line Here
import './css/global.css'
// import Delvaux from './phoneticae/Delvaux'

// import Logo from '../public/assets/wechat.png'

// components
// import Nav from "./components/Nav";
// import FilterAuthor from './phoneticae/FilterAuthor';
// import FilterStore from './phoneticae/FilterStore';
// import BiblioList from './phoneticae/BiblioList'
// import BiblioItem from './phoneticae/BiblioItem'
// import Header from './phoneticae/Header';
// import Quote from './phoneticae/Quote';
import FixedNav from './phoneticae/FixedNav';
// import About from './components/About';
// import Toc from './components/Toc';
// import Nomatch from './components/Nomatch';

class App extends Component {

  state = {
    // biblio: Vaissiere,
    keyword: "",
    filteredBiblio: [],
    noInput: true
  }


  // rende the searched content

  // headerKeywordChangeHandler = (e) => {
  //   // get the value
  //   let keyword = e.target.value;
  //   // filter the list
  //   let filtered = this.state.biblio.filter((item) => {
  //     return item.title.toLowerCase().indexOf(keyword.toLowerCase()) > -1 || item.content.toLowerCase().indexOf(keyword.toLowerCase()) > -1
  //   })
  //   this.setState({ keyword: e.target.value, filteredBiblio: filtered, noInput: false })
  // };


  render() {
    // destructuring
    // const { filteredBiblio, biblio, noInput } = this.state;
    // console.log(noInput)
    return (
      <div>
        <FixedNav />
        <ScrollUpButton />
      </div>
    )
  }
}

ReactDOM.render(<App />, document.querySelector('#root'));