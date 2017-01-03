import React from 'react';

class TodoDetailView extends React.Component {
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
      <div>
        <div>{todo.body}</div>
        <ul></ul>
        <form></form>
        <button onClick={this.handleDelete}>Delete</button>
      </div>
    );
  }
}

export default TodoDetailView;
