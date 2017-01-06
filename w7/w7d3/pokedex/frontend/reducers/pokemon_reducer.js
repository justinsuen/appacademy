import { merge } from 'lodash';
import { RECEIVE_ALL_POKEMON, RECEIVE_NEW_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, action.pokemon);
    case RECEIVE_NEW_POKEMON:
      return merge({}, state, {
        [action.pokemon.id]: action.pokemon
      });
    default:
      return state;
  }
};

export default pokemonReducer;
