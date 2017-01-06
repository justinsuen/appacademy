import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
export const RECEIVE_NEW_POKEMON = "RECEIVE_NEW_POKEMON";

// sync functions
export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = pokemon => ({
  type: RECEIVE_SINGLE_POKEMON,
  pokemon
});

export const receiveNewPokemon = pokemon => ({
  type: RECEIVE_NEW_POKEMON,
  pokemon
});

// async functions
export const requestAllPokemon = () => dispatch => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const requestSinglePokemon = id => dispatch => {
  return APIUtil.fetchSinglePokemon(id)
    .then(pokemon => {
      dispatch(receiveSinglePokemon(pokemon));
      return pokemon;
    }
  );
};

export const createNewPokemon = pokemon => dispatch => (
  APIUtil.createNewPokemon(pokemon).then((pokemon) => {
		dispatch(receiveNewPokemon(pokemon));
		return pokemon;
	})
);
