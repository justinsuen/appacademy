import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import { receiveSteps, receiveStep, removeStep } from './actions/step_actions';
import { stepsByTodoId } from './reducers/selectors';

let store = configureStore();

// Testing
window.store = store;
window.receiveSteps = receiveSteps;
window.receiveStep = receiveStep;
window.removeStep = removeStep;
window.stepsByTodoId = stepsByTodoId;

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root store={store}/>, document.getElementById('content'));
});
