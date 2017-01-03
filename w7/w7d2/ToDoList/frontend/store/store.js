import { createStore, applyMiddleware } from 'redux';
import thunk from '../middleware/thunk';
import rootReducer from '../reducers/root_reducer';

const configureStore = (myState = {}) => {
  const store = createStore(rootReducer, myState, applyMiddleware(thunk));

  // Local storage version
  // store.subscribe(() => {
  //   localStorage.state = JSON.stringify(store.getState());
  // });

  // Testing
  // store.dispatch((dispatch) => {
  //   console.log("Thunk is working!");
  // });

  return store;
};

export default configureStore;
