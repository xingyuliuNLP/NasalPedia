import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, NavLink, Switch, Redirect } from 'react-router-dom';
import Conditional from './lifecirclePlusConditional/lifecirclePlusConditional';
import pureCp from './lifecirclePlusConditional/pureCp';

class App extends Component {
  //* 1: get default props
  //* 2: set default state
  state = {
    title: "the second step is rendering default state"
  }

  //* 3: before render 
  // ! notice the fourth is before third, but it's ok
  componentDidMount() {
    console.log("4 mounted");
    // document.querySelector('h3').style.color = "red";
  }

  componentWillMount() {
    console.log("3 will mount")
    // ! will throw an eror because doesn't exist yet: document.querySelector('h3').style.color = "red";
    // document.querySelector('h3').style.color = "red";
  }

  componentWillUpdate() {
    console.log("will update")
  }

  componentDidUpdate = () => {
    console.log("did update")
  };

  // componentWillReceiveProps = () => {
  //   console.log("this is for new props not default props") 
  // }

  // case : client leaves a page : send alert maybe

  // componentWillUnmount() {
  //   console.log("unmounted");
  // }
  // control the update process, don't update everydate the state changes

  shouldComponentUpdate(nextProps, nextState, nextContext) {
    console.log(this.state.title);
    console.log(nextState.title);
    if (nextState.title === "something else") {
      return false;
    }
  }

  // 


  //* 4: render jsx


  render() {
    console.log("first the props object" + this.props)
    console.log("second the state " + this.state)
    console.log("render");
    // render shows twice when clicked
    return (
      // <div onClick={() =>
      //   this.setState({ title: "something else" })
      // }>
      <div>
        <Router>
          <h3>{this.state.title}</h3>
          <NavLink to="/conditional">conditional</NavLink>
          <NavLink to="/pure">pure</NavLink>
          <Route path="/conditional" component={Conditional} ></Route>
          <Route path="/pure" component={pureCp} ></Route>
        </Router>
      </div>

    );
  }
}

ReactDOM.render(
  <App />,
  document.querySelector('#root')
);
