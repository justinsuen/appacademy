import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';

const todosReducer = (state = {}, action) => {
  let newState = merge({}, state);

  switch (action.type) {
    case RECEIVE_TODOS:
      for (let todoKey in action.todos) {
        newState[action.todos[todoKey].id] = action.todos[todoKey];
      }
      return newState;
    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return newState;
    case REMOVE_TODO:
      delete newState[action.todo.id];
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
