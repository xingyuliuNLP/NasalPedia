import React, { Component } from 'react';

class Uncontrolled extends Component {

  clickHandler(e) {
    e.preventDefault(); // without this line the formular will restart
    const values = {
      name: this.name.value,
      lastName: this.lastName.value
    }
    console.log(values);
  }

  render() {
    return (
      <div className="container">
        <form>
          <div className="form_element">
            <label>Enter Name</label>
            <input type="text" ref={input => this.name = input}
            />
          </div>
          <div className="form_element">
            <label>Last Name</label>
            <input type="text" ref={input => this.lastName = input} />
          </div>
          <button onClick={(e) => {
            this.clickHandler(e)
          }
          }>
            Click to submit
            </button>
        </form>
      </div>
    )
  }
}

export default Uncontrolled;