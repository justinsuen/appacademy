import React from 'react';
import merge from 'lodash/merge';
import { uniqueId } from '../../util/util.js';
import ErrorList from './error_list';

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

    let todo = merge({}, this.state);
    todo.id = uniqueId();

    this.props.createTodo({ todo }).then(
      () => this.setState({ title: "", body: "" })
    );
  }

  render() {
    return (
      <form className="todo-form" onSubmit={this.handleSubmit}>
        <ErrorList errors={ this.props.errors } />
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
