import { combineReducers } from 'redux';
import pokemonReducer from './pokemon_reducer';

const rootReducer = combineReducers({
  pokemon: pokemonReducer
});

export default rootReducer;
