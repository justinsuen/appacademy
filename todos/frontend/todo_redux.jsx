import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

let store = configureStore();

// Testing
window.store = store;

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root store={store}/>, document.getElementById('content'));
});
