import { merge } from "lodash";
import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER } from "../actions/session_actions.js";

const _nullUser = Object.freeze({
  currentUser: null,
  errors: []
});

const SessionReducer = (state = _nullUser, action) => {
  Object.freeze(state);

  switch(action.type) {
    case RECEIVE_ERRORS:
      return merge({}, state, { currentUser: null, errors: action.errors });
    case RECEIVE_CURRENT_USER:
      return merge({}, state, { currentUser: action.currentUser });
    default:
      return state;
  }
};

export default SessionReducer;
