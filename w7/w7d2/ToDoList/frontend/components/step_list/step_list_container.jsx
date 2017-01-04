import { connect } from 'react-redux';
import StepList from './step_list';
// Actions
import { stepsByTodoId } from '../../reducers/selectors';
import { createStep } from '../../actions/step_actions';

window.stepsByTodoId = stepsByTodoId;

const mapStateToProps = (state, ownProps) => {
  debugger;
  return {
    steps: stepsByTodoId(state, ownProps.todoId),
    todoId: ownProps.todoId
  };
};

const mapDispatchToProps = (dispatch, ownProps) => ({
  createStep: (...args) => dispatch(createStep(...args))
});


const StepListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);

export default StepListContainer;
