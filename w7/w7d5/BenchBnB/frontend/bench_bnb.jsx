import React from 'react';
import ReactDOM from 'react-dom';
import { signup, signin, signout } from './util/session_api_util';
import { configureStore } from './store/store';

window.signup = signup;
window.signin = signin;
window.signout = signout;
window.store = configureStore(); //just for testing!

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<h1>Welcome to BenchBnB!</h1>, root);
});
