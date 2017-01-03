import * as TodoAPIUtil from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
export const TODO_ERROR = "TODO_ERROR";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo
  };
};

export const removeTodo = (todo) => {
  return {
    type: REMOVE_TODO,
    todo
  };
};

// Async functions
export const requestTodos = () => dispatch => {
  return TodoAPIUtil.fetchTodos().then(
    todos => dispatch(receiveTodos(todos))
  );
};

export const createTodo = (todo) => dispatch => {
  return TodoAPIUtil.createTodo(todo)
    .then(todo => dispatch(receiveTodo(todo)),
          err => dispatch(receiveErrors(err.responseJSON))
  );
};
