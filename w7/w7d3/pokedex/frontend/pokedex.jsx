import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

// Testing functions
import { receiveSinglePokemon, requestSinglePokemon } from './actions/pokemon_actions';
import { fetchSinglePokemon } from './util/api_util';

// Testing window assignments
window.receiveSinglePokemon = receiveSinglePokemon;
window.fetchSinglePokemon = fetchSinglePokemon;
window.requestSinglePokemon = requestSinglePokemon;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
