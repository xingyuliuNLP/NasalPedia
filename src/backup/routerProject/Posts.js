import React from 'react'
import { Link } from 'react-router-dom';


const Posts = () => {
  return (
    <div>
      <Link to="post/1">post 1</Link> <br />
      <Link>post 2</Link> <br />
      <Link>post 3</Link>
    </div>
  );
}

export default Posts;