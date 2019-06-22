import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, NavLink, Switch, Redirect } from 'react-router-dom';
// * also has memoryrouter  hashrouter

// ? components
import Home from './routerProject/Home';
import Profiles from './routerProject/Profiles';
import Posts from './routerProject/Posts';
import PostItem from './routerProject/PostItem';


const App = () => {
  // console.log(Route);
  return (
    <BrowserRouter>
      <div>
        <header>
          <NavLink to="/">Home</NavLink>
          <NavLink to="/profile">Profiles</NavLink>
          <NavLink to={{
            pathname: '/post'
            // hash: '#test'
            // search: '?test=true'
          }}
            activeStyle={{ color: 'red' }
              // activeClassName ="activeLink"
            }>Post</NavLink>
        </header>
        {/* really important to write something in componentes before render */}
        <Switch>
          {/* <Redirect from="/profile" to="/" /> */}
          <Route path="/post/:id/:username" component={PostItem} />
          <Route path="/profile" component={Profiles} />
          <Route path="/post" component={Posts} />
          <Route path="/" exact component={Home} />
          <Route render={() => <h3>404 error</h3>} />
          {/*  
          ! also possible using component on 404 
          */}
        </Switch>
      </div>
    </BrowserRouter>
  )
}

ReactDOM.render(
  <App />,
  document.querySelector('#root')
)