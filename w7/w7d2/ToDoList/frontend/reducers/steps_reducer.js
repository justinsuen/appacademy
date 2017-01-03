import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from '../actions/step_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: "use hands with gloves",
    done: false,
    todoId: 1
  },
  2: {
    id: 2,
    title: "use hands",
    done: true,
    todoId: 2
  },
  3: {
    id: 3,
    title: "wash other dog",
    done: true,
    todoId: 2
  },
};

const stepsReducer = (state = initialState, action) => {
  let newState = merge({}, state);

  switch (action.type) {
    case RECEIVE_STEPS:
      for (let stepKey in action.steps) {
        newState[action.steps[stepKey].id] = action.steps[stepKey];
      }
      return newState;
    case RECEIVE_STEP:
      newState[action.step.id] = action.step;
      return newState;
    case REMOVE_STEP:
      delete newState[action.step.id];
      return newState;
    default:
      return state;
  }
};

export default stepsReducer;
