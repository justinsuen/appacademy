import React from 'react';
import Item from '../items/item';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestSinglePokemon(this.props.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.params.pokemonId !== newProps.params.pokemonId)
      this.props.requestSinglePokemon(newProps.params.pokemonId);
    }

  render() {
    const {pokemonDetail, children} = this.props;

    return (
      <div className="pokemon-details-view">
        <ul className="pokemon-details">
          <img src={pokemonDetail.image_url} alt={pokemonDetail.name}/>
          <li>{pokemonDetail.id} {pokemonDetail.name}</li>
          <li>Type: {pokemonDetail.poke_type}</li>
          <li>Attack: {pokemonDetail.attack}</li>
          <li>Defense: {pokemonDetail.defense}</li>
          <li>Moves: {pokemonDetail.moves.join(", ")}</li>
          <li className="pokemon-items">Items:
            <ul className="pokemon-items-img">
              {pokemonDetail.items.map(item => <Item key={item.name} item={item}/>)}
            </ul>
            {children}
          </li>
        </ul>
      </div>
    );
  }
}

export default PokemonDetail;
