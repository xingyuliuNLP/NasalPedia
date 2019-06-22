

import React from 'react';
import hoc from '../hoc_project/hoc';
// import ReactDom from 'react-dom';

const Conditional = (props) => {
  const value = true;
  const returnValue = () => {
    return false;
  }
  const toggleContent = () => {
    return (
      returnValue() ?
        <h2>it's true</h2>
        :
        <h2>it's false</h2>
    )
  }

  return (
    <div>
      {/* normally it's empty but we can pass it from the hoc.js */}
      {console.log(`lower order ${props}`)}
      <h2>a conditional demo</h2>
      {toggleContent()}
    </div>

  );
}

const comp2 = () => {
  return (
    <h3>hehe</h3>
  )
}


export default hoc(Conditional, comp2, "arg1");
