import { values } from 'lodash';

export const selectAllPokemon = ({ pokemon }) => values(pokemon);

export const selectPokemonItem = ({ pokemonDetail }, itemId) => {
	const foundItem = pokemonDetail.items.find((item, idx) => idx === itemId);
	return foundItem || {};
};
