import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { receiveAllPokemon } from './actions/pokemon_actions';
import { fetchAllPokemon } from './util/api_util';

// Testing
window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;


document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;

  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});
