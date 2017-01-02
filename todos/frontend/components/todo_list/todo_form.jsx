import React from 'react';
import { uniqueId } from '../../util/util.js';
import merge from 'lodash/merge';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = { id: "", title: "", body: "", done: false };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    switch(e.target.name) {
      case "title":
        this.setState({ title: e.target.value });
        break;
      case "body":
        this.setState({ body: e.target.value });
        break;
    }
  }

  handleSubmit(e) {
    e.preventDefault();

    let newTodo = merge({}, this.state);
    newTodo.id = uniqueId();

    this.props.receiveTodo(newTodo);
    this.setState({ id: "", title: "", body: "", done: false });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Title:
          <input
            name="title"
            type="text"
            value={this.state.title}
            onChange={this.handleChange}
            />
        </label>
        <label>
          Body:
          <textarea
            name="body"
            value={this.state.body}
            onChange={this.handleChange}
            />
        </label>
        <input type="submit" value="Create Todo!" />
      </form>
    );
  }
}

export default TodoForm;
