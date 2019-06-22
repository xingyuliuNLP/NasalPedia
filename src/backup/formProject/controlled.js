import React, { Component } from 'react';

class Controlled extends Component {

  state = {
    name: "",
    lastName: ""
  }

  changeNameHandler = (e) => {
    this.setState({
      name: e.target.value
    })
    // console.log(e.target.value)
  }


  changeLastnameHandler = (e) => {
    this.setState({
      lastName: e.target.value
    })
  }

  submitHandler = (e) => {
    e.preventDefault();
    console.log(this.state);
  }


  render() {
    return (
      <div className="container">
        <div className="form_element">
          <form onSubmit={this.submitHandler}>
            <label>Enter Name</label>
            <input type="text" value={this.state.name} onChange={(e) => {
              this.changeNameHandler(e)
            }} />
            <button type="submit">hehe</button>
          </form>
        </div>
        <div className="form_element">
          <form>
            <label>Last Name</label>
            <input type="text" value={this.state.lastName} onChange
              ={(e) => {
                this.changeLastnameHandler(e)
              }} />
          </form>
        </div>

      </div>
    )
  }
}

export default Controlled;