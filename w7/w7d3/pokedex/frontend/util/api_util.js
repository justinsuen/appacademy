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
