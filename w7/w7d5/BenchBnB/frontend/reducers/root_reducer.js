import { combineReducers } from 'redux';
import SessionReducer from './session_reducer';

const rootReducer = combineReducers({
  sessions: SessionReducer
});

export default rootReducer;
