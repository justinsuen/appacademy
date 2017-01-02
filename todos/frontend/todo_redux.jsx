import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { allTodos } from './reducers/selectors';
import { receiveTodo, receiveTodos } from './actions/todo_actions';
import Root from './components/root';

let store = configureStore();

// Testing
window.store = store;
window.allTodos = allTodos;
const newTodos = [
    {id: 5, title: "clean room", body: "today", done: false },
    {id: 4, title: "laundry", body: "tomorrow", done: false }
  ];
window.newTodos = newTodos;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root store={store}/>, document.getElementById('content'));
});
