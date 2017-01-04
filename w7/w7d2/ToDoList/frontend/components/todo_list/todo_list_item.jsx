import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      detail: false
    };

    this.handleUpdate = this.handleUpdate.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick (e) {
    e.preventDefault();
    if (e.target.type !== 'submit') {
      let detailShow = (this.state.detail) === true ? false : true;
      this.setState({
        detail: detailShow
      });
    }
  }

  handleUpdate (e) {
    e.preventDefault();
    this.props.todo.done = (this.props.todo.done === true) ? false : true;
    this.props.updateTodo(this.props.todo);
    if (this.props.todo.done) {
      $(e.target).prev('.todo-title').addClass('done-item-title');
    } else {
      $(e.target).prev('.todo-title').removeClass('done-item-title');
    }
  }

  render() {
    let todo = this.props.todo;

    let todoDV = <TodoDetailViewContainer todo={todo} />;

    return (
      <li className="todo-item">
        <div className="todo-text" onClick={this.handleClick}>
          <div className="todo-title">
            { todo.title }
          </div>
          <button onClick={this.handleUpdate} className={todo.done === true ? "undo" : "done"}>
            {todo.done === true ? "Undo" : "Done"}
          </button>
        </div>
        { this.state.detail ? todoDV : null }
      </li>
    );
  }
}

export default TodoListItem;
