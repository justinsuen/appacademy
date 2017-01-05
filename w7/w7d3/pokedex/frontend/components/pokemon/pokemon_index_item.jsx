import React from 'react';

class PokemonIndexItem extends React.Component {
  render() {
    const { pokemon } = this.props;

    return (
      <li>
        <img src={pokemon.image_url} alt={pokemon.name}/>
        <span>{pokemon.name}</span>
      </li>
    );
  }
}

export default PokemonIndexItem;
