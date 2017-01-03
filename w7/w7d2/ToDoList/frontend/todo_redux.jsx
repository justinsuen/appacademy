import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import { requestTodos } from './actions/todo_actions';

document.addEventListener('DOMContentLoaded', () => {
  // Local storage version
  // const myState = localStorage.state ? JSON.parse(localStorage.state) : {};
  const store = configureStore();

  // Testing
  window.store = store;
  window.requestTodos = requestTodos;

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store}/>, root);
});
