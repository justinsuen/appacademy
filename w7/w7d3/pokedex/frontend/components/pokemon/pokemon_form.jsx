import React from 'react';

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);

    this.handleUpdate = this.handleUpdate.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleUpdate(property) {
    return e => this.setState({[property]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.createNewPokemon(this.state).then((newPokemon) => {
      this.props.router.push(`pokemon/${newPokemon.id}`);
    });
  }

  componentDidMount() {
  }

  render() {
    return (
      <div></div>
    );
  }
}

export default PokemonForm;
