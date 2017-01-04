import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';

import { destroyTodo } from '../../actions/todo_actions';
import { receiveSteps } from '../../actions/step_actions';

const mapDispatchToProps = (dispatch, { todo }) => ({
  requestSteps: () => dispatch(receiveSteps(todo)),
  destroyTodo: () => dispatch(destroyTodo(todo))
});


const TodoDetailViewContainer = connect(
  null,
  mapDispatchToProps
)(TodoDetailView);

export default TodoDetailViewContainer;
