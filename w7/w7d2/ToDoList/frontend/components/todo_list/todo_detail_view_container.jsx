import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';

import { destroyTodo } from '../../actions/todo_actions';
import { requestSteps } from '../../actions/step_actions';

const mapDispatchToProps = (dispatch, { todo }) => ({
  requestSteps: () => dispatch(requestSteps(todo.id)),
  destroyTodo: () => dispatch(destroyTodo(todo))
});


const TodoDetailViewContainer = connect(
  null,
  mapDispatchToProps
)(TodoDetailView);

export default TodoDetailViewContainer;
