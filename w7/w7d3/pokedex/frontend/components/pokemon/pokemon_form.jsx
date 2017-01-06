import React from 'react';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      name: '',
      image_url: '',
      poke_type: 'bug',
      attack: '',
      defense: '',
      moves: {}
    };

    this.handleUpdate = this.handleUpdate.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateMoves = this.updateMoves.bind(this);
  }

  handleUpdate(property) {
    return e => this.setState({[property]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createNewPokemon(this.state)
      .then(data => this.props.router.push(`/pokemon/${data.id}`)
    );
  }

  updateMoves(e) {
    this.setState({moves: Object.assign({}, this.state.moves, {
          [e.target.id]: e.target.value
        }
      )}
    );
  }

  render() {
    const pokemonTypes = [
      "fire",
      "electric",
      "normal",
      "ghost",
      "psychic",
      "water",
      "bug",
      "dragon",
      "grass",
      "fighting",
      "ice",
      "flying",
      "poison",
      "ground",
      "rock",
      "steel"
    ];

    return (
      <form className="pokemon-form" onSubmit={this.handleSubmit}>
        <input type="text" value={this.state.name} placeholder="Name" onChange={this.handleUpdate('name')}/>
        <input type="text" value={this.state.image_url} placeholder="Image Url" onChange={this.handleUpdate('image_url')}/>
        <select value={this.state.type} onChange={this.handleUpdate('poke_type')} defaultValue="Select Pokemon Type">
          {pokemonTypes.map((type, idx) => {
            return <option value={type} key={idx}>{type}</option>;
          })}
        </select>
        <input type="number" value={this.state.attack} placeholder="Attack" onChange={this.handleUpdate('attack')}/>
        <input type="number" value={this.state.defense} placeholder="Defense" onChange={this.handleUpdate('defense')}/>
        <input type="text" id="move_1" value={this.state.moves.move_1 || ''} placeholder="Move 1" onChange={this.updateMoves}/>
        <input type="text" id="move_2" value={this.state.moves.move_2 || ''} placeholder="Move 2" onChange={this.updateMoves}/>
        <button>Create Pokemon</button>
      </form>
    );
  }
}

export default PokemonForm;
