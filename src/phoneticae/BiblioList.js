import React from 'react';
import BiblioItem from './BiblioItem';
import uuid from "uuid";
// bibliolist is prop
const BiblioList = (props) => {
  const items = props.biblio.map((item) => {
    // return (<BiblioItem key={item.id} item={item} />)
    // send key and item as props
    return (<BiblioItem key={uuid()} item={item} />)
  }
  )

  // console.log(uuid());
  return (
    <div>
      {items}
    </div>
  )
}

export default BiblioList;