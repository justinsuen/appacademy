import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
  }

  handleDelete (e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  render() {
    let todo = this.props.todo;
    return (
      <li>
        { todo.title }
        <button onClick={this.handleDelete}>Delete</button>
      </li>
    );
  }
}

export default TodoListItem;
