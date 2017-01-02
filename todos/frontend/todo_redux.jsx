import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { allTodos } from './reducers/selectors';
import { receiveTodo, receiveTodos } from './actions/todo_actions';

window.store = configureStore();
window.allTodos = allTodos;
const newTodos = [
    {id: 5, title: "clean room", body: "today", done: false },
    {id: 4, title: "laundry", body: "tomorrow", done: false }
  ];
window.newTodos = newTodos;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;

class Root extends React.Component {
  render() {
    return (
      <div>
        <h1>Hello!</h1>
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root/>, document.getElementById('content'));
});
