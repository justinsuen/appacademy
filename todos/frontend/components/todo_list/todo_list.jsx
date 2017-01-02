import React from 'react';
import TodoListItem from './todo_list_item';

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
            <TodoListItem key={idx} todo={todo}/>
          )}
        </ul>
      </div>
    );
  }
}

export default TodoList;
