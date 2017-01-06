import React from 'react';
import { Link } from 'react-router';

class PokemonIndexItem extends React.Component {
  render() {
    const { pokemon } = this.props;

    return (
      <Link to={`/pokemon/${pokemon.id}`} className="pokemon-list-item">
        <span>{pokemon.id}</span>
        <img src={pokemon.image_url} alt={pokemon.name}/>
        <span>{pokemon.name}</span>
      </Link>
    );
  }
}

export default PokemonIndexItem;
