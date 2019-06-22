// css transition adds some default class for us
import React, { Component } from 'react';
import { CSSTransition } from 'react-transition-group/';

import '../css/App.css';

class Fade extends Component {

  state = {
    show: true,
    action: "hide"
  }

  toggleTrue = () => {
    this.setState({
      show: this.state.show ? false : true,
      action: this.state.action === "hide" ? "show" : "hide "
    })
  }

  render() {
    return (
      <div>

        <CSSTransition
          timeout={3000}
          in={this.state.show}
          // case css name to append to the following div, note that there is no classname before clicking so we add square manually
          classNames="square"
        >
          {state => <div className={`square ${this.state.show}`}>css transition {state}</div>}

        </CSSTransition>
        <div className="showDiv" onClick={this.toggleTrue}>
          {this.state.action}
        </div>
      </div>
    )
  }
}


export default Fade;