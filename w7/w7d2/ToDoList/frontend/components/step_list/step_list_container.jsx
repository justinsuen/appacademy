import { connect } from 'react-redux';
import StepList from './step_list';
import { stepsByTodoId } from '../../reducers/selectors';
import { receiveStep, removeStep } from '../../actions/step_actions';

window.stepsByTodoId = stepsByTodoId;

const mapStateToProps = (state, ownProps) => {
  return { steps: stepsByTodoId(state, ownProps.todoId) };
};

const mapDispatchToProps = dispatch => ({
  receiveStep: (step) => dispatch(receiveStep(step)),
  removeStep: (step) => dispatch(removeStep(step))
});


const StepListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);

export default StepListContainer;
