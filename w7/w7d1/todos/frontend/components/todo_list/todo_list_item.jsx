import React from 'react';
import TodoDetailView from './todo_detail_view';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      detail: false
    };

    this.handleUpdate = this.handleUpdate.bind(this);
    this.handleTitleClick = this.handleTitleClick.bind(this);
  }

  handleTitleClick (e) {
    e.preventDefault();
    let detailShow = (this.state.detail) === true ? false : true;
    this.setState({
      detail: detailShow
    });
  }

  handleUpdate (e) {
    e.preventDefault();
    this.props.todo.done = (this.props.todo.done === true) ? false : true;
    this.props.receiveTodo(this.props.todo);
  }

  render() {
    let todo = this.props.todo;

    let todoDV = <TodoDetailView
      todo={todo}
      removeTodo={this.props.removeTodo}
      />;

    return (
      <li>
        <div onClick={this.handleTitleClick}>
          { todo.title }
        </div>
        <button onClick={this.handleUpdate}>
          {todo.done === true ? "Undo" : "Done"}
        </button>
        { this.state.detail ? todoDV : null }
      </li>
    );
  }
}

export default TodoListItem;
