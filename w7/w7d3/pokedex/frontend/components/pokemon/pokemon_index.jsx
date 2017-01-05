import React from 'react';

class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const { pokemon } = this.props;

    return(
      <ul>
        { pokemon.map(poke => {
            return(
              <li key={poke.id}>
                <img src={poke.image_url} alt={poke.name} />
                <span>{poke.name}</span>
              </li>
            );
          })
        }
      </ul>
    );
  }
}

export default PokemonIndex;
