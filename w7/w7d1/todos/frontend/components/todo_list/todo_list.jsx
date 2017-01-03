import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>Todo List</h1>
        <ul>
          { this.props.todos.map((todo, idx) =>
            <TodoListItem
              key={idx}
              todo={todo}
              removeTodo={this.props.removeTodo}
              receiveTodo={this.props.receiveTodo}
              />
          )}
        </ul>
        <div>
          <TodoForm
            receiveTodo={this.props.receiveTodo}
            />
        </div>
      </div>
    );
  }
}

export default TodoList;
