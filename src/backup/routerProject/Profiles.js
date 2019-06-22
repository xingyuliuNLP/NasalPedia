import React from 'react'
import { NavLink, Redirect } from 'react-router-dom';


const Profiles = (props) => {
  console.log(props);

  const redir = (props) => {
    return (
      <Redirect to="/" />
    )
    // props.history.push('/') works too
  }

  return (
    <div>
      <NavLink to={`${props.match.url}/post`}>Take me to some link</NavLink>

      {redir()}

    </div>
  );
}

export default Profiles;