import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

document.addEventListener('DOMContentLoaded', () => {
  const myState = localStorage.state ? JSON.parse(localStorage.state) : {};
  const store = configureStore(myState);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store}/>, root);
});
