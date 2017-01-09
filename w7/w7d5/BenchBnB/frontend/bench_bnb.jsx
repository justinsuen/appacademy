import React from 'react';
import ReactDOM from 'react-dom';
import { signup, signin, signout } from './util/session_api_util';

window.signup = signup;
window.signin = signin;
window.signout = signout;

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<h1>Welcome to BenchBnB!</h1>, root);
});
