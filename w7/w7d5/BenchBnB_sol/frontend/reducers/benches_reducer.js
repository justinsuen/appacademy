import { CREATE_REVIEW,
  RECEIVE_REVIEW,
  RECEIVE_BENCHES,
  RECEIVE_BENCH } from '../actions/bench_actions';
import merge from 'lodash/merge';

const BenchesReducer = (state = {}, action) => {
  Object.freeze(state)
  let newState = merge({}, state);

  switch(action.type) {
    case RECEIVE_BENCHES:
      return action.benches;
    case RECEIVE_BENCH:
      const newBench = {[action.bench.id]: action.bench};
      return merge({}, state, newBench);
    case RECEIVE_REVIEW:
      const review = action.review;
      newState[review.bench_id].reviews.push(review)
      return newState;
    default:
      return state;
  }
};

export default BenchesReducer;

