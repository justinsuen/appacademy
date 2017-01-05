import React from 'react';
import { Provider } from 'react-redux';
import { Router, Route, hashHistory } from 'react-router';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import PokemonDetailContainer from './pokemon/pokemon_detail_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <Router history={ hashHistory }>
      <Route path="/" component={ PokemonIndexContainer }>
        <Route path="pokemon/:pokemonId" component={ PokemonDetailContainer }/>
      </Route>
    </Router>
  </Provider>
);

export default Root;
