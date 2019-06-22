import React, { Component } from 'react';
import '../css/App.css';
import Transition from 'react-transition-group/Transition';

class TransitionComp extends Component {

  state = {
    show: true
  }

  toggleTrue = () => {
    this.setState({
      show: this.state.show ? false : true
    })
  }

  style = {
    background: "red",
    height: '200px'
  }

  // mountOnEnter
  // unmountOnExit
  render() {
    return (
      <div>
        <Transition
          in={this.state.show}
          // timeout = 4000
          timeout={{
            enter: 2000,
            exit: 2000
          }}
          // need these two being true so that onEnter and onExit work
          // enter={false}
          // exit={false}

          onEnter={(node) => {
            console.log("entered!")
          }}
          onExit={(node) => {
            console.log("exited!")
          }}
        >
          {/* this returns a function with a state not an animation itself */}
          {/* exited = transition done, exiting = doing transition */}
          {state =>
            // <div style={{
            //   background: "red",
            //   height: '100px',
            //   transition: 'all 2s ease',
            //   opacity: state === 'exited' || state === 'exiting' ? 0 : 1
            // }}>state of the transition output function {state}</div>
            <div className={`square square-${state}`}>
              {state}
            </div>
          }
        </Transition>

        <div className="showDiv" onClick={this.toggleTrue}>
          show or hide
        </div>

      </div>
    )
  }



}


export default TransitionComp;