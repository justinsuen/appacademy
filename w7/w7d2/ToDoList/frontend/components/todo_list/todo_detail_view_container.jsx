import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';
import { destroyTodo } from '../../actions/todo_actions';
import { receiveSteps } from '../../actions/step_actions';

const mapDispatchToProps = dispatch => ({
  destroyTodo: (todo) => dispatch(destroyTodo(todo)),
  receiveSteps: (steps) => dispatch(receiveSteps(steps))
});


const TodoDetailViewContainer = connect(
  null,
  mapDispatchToProps
)(TodoDetailView);

export default TodoDetailViewContainer;
