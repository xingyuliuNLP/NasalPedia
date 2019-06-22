import React from 'react';
// import { css } from 'glamor';
import styles from './BiblioItem.module.css';
// import { stringLiteral } from '@babel/types';
import classNames from 'classnames';
import uuid from "uuid";
// <div className={`${rule} ${another}`}>
//   zomg
// </div>

// const test = classNames('col-xs-4', 'col-md-6', styles.biblioItem);
const test = classNames(styles.biblioItem);


// console.log(test + " test");
const BiblioItem = ({ item }) => {
  // console.log(key);
  // let biblio_item = css({
  //   padding: '20px',
  //   boxSizing: 'border-box',
  //   borderBottom: '1px solid gray',
  //   ':hover': {
  //     color: 'red'
  //   },
  //   '@media(max-width:500px)': {
  //     color: 'blue'
  //   }
  // })

  // let item_grey = css({
  //   background: 'lightgrey'
  // })
  // const classes = ["red", "green", styles.test].join(" ")
  // const test = "hehe\ngggg\n";
  const newText = item.content.split('\n').map(
    (x, i) => {
      return <p>{x}</p>
    }
  )
  console.log(newText)
  return (
    // <div {...biblio_item} {...item_grey}>
    <div className={test} >
      {/* <div className={`${styles.biblioItem}`} > */}
      <h3>{item.title}</h3>
      <div>
        {newText}
        {/* {console.log(splitLines)} */}
        {/* {splitLines(splitLines)} */}
      </div>
    </div >)

}

export default BiblioItem;