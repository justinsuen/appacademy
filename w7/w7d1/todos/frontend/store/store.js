import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (myState = {}) => {
  const store = createStore(rootReducer, myState);
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
