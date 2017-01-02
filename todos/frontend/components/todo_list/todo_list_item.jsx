import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
    this.handleUpdate = this.handleUpdate.bind(this);
  }

  handleDelete (e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  handleUpdate (e) {
    e.preventDefault();
    this.props.todo.done = (this.props.todo.done === true) ? false : true;
    this.props.receiveTodo(this.props.todo);
  }

  render() {
    let todo = this.props.todo;

    return (
      <li>
        { todo.title }
        <button onClick={this.handleDelete}>Delete</button>
        <button onClick={this.handleUpdate}>
          {todo.done === true ? "Undo" : "Done"}
        </button>
      </li>
    );
  }
}

export default TodoListItem;
