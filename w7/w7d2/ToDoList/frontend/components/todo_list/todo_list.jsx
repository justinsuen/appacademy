import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestTodos();
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
              updateTodo={ this.props.updateTodo }
              />
          )}
        </ul>
        <TodoForm
          createTodo={ this.props.createTodo }
          errors={ this.props.errors }
          />
      </div>
    );
  }
}

export default TodoList;
