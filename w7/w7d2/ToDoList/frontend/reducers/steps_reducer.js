import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP } from '../actions/step_actions';
import merge from 'lodash/merge';

const stepsReducer = (state = {}, action) => {
  let newState = merge({}, state);

  switch (action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach((step) =>
        newState[step.id] = step
      );
      // for (let stepKey in action.steps) {
      //   newState[action.steps[stepKey].id] = action.steps[stepKey];
      // }
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
