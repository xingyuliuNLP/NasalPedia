import React from 'react';
import { Route, Switch } from 'react-router-dom';

import Header from './formProject/Header/header';
import Uncontrolled from './formProject/uncontrolled';
import Controlled from './formProject/controlled';
import User from './formProject/user';

const Routes = () => {
  return (
    <div>
      <Header />
      <Switch>
        <Route path="/uncontrolled" exact component={Uncontrolled} />
        <Route path="/controlled" exact component={Controlled} />
        <Route path="/user" exact component={User} />
      </Switch>
    </div>
  )
};

export default Routes;