import React from 'react';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestSinglePokemon(this.props.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.params.pokemonId !== newProps.params.pokemonId)
      this.props.requestSinglePokemon(newProps.params.pokemonId);
  }

  render() {
    const {pokemonDetail} = this.props;

    return (
      <div>
        <ul>
          <figure>
            <img src={pokemonDetail.image_url} alt={pokemonDetail.name}/>
          </figure>
          <li>Id: {pokemonDetail.id}</li>
          <li>Name: {pokemonDetail.name}</li>
          <li>Attack: {pokemonDetail.attack}</li>
          <li>Defense: {pokemonDetail.defense}</li>
          <li>Moves: {pokemonDetail.moves.join(", ")}</li>
          <li>Type: {pokemonDetail.poke_type}</li>
          <li>Items: {pokemonDetail.items}</li>
        </ul>
      </div>
    );
  }
}

export default PokemonDetail;
