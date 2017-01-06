export const fetchAllPokemon = () => (
  $.ajax({
    method: 'GET',
    url: 'api/pokemon'
  })
);

export const fetchSinglePokemon = pokemonId => (
  $.ajax({
    method: 'GET',
    url: `api/pokemon/${pokemonId}`
  })
);

export const createNewPokemon = (pokemon) => {
  pokemon.moves = Object.keys(pokemon.moves).map(move => pokemon.moves[move]);

  return $.ajax({
    method: 'POST',
    url: 'api/pokemon',
    data: { pokemon }
  });
};
