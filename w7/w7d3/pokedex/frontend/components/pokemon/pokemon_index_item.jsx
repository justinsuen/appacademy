import React from 'react';
import { Link } from 'react-router';

class PokemonIndexItem extends React.Component {
  render() {
    const { pokemon } = this.props;

    return (
      <li>
        <Link to={`/pokemon/${pokemon.id}`}>
          <img src={pokemon.image_url} alt={pokemon.name}/>
          <span>{pokemon.name}</span>
        </Link>
      </li>
    );
  }
}

export default PokemonIndexItem;
