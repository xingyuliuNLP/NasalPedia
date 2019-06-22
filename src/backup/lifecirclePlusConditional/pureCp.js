import React, { PureComponent } from 'react'

export default class pureCp extends PureComponent {
  state = {
    title: 'test'
  }

  clickHandler = () => {
    this.setState(
      { title: 'somethingElse' }
    )
  }

  render() {
    console.log('render');
    // console.log(this.state.title);
    return (
      <div>
        <h2>this is a {this.state.title}</h2>
        <div onClick={() => {
          this.clickHandler()
        }
        }> oh please click here to change title
        </div>
      </div>

    )
  }
}
