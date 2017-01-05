import { merge } from 'lodash';
import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';

const defaultPokemon = {
  image_url: '',
  name: '',
  poke_type: '',
  attack: '',
  defense: '',
  moves: [],
  items: []
};

const pokemonDetailReducer = (state = defaultPokemon, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      return merge({}, action.pokemon);
    default:
      return state;
  }
};

export default pokemonDetailReducer;
