import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="todo-container">
        <div className="title-block">
          <h1 className="title">To-do List</h1>
        </div>
        <ul className="todo-list">
          { this.props.todos.map((todo, idx) =>
            <TodoListItem
              key={idx}
              todo={todo}
              removeTodo={this.props.removeTodo}
              receiveTodo={this.props.receiveTodo}
              />
          )}
        </ul>
        <TodoForm
          receiveTodo={this.props.receiveTodo}
          />
      </div>
    );
  }
}

export default TodoList;
