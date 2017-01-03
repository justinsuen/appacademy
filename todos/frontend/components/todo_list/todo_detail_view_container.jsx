import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';
import { removeTodo } from '../../actions/todo_actions';

const mapDispatchToProps = dispatch => ({
  removeTodo: (todo) => dispatch(removeTodo(todo))
});


const TodoDetailViewContainer = connect(
  null,
  mapDispatchToProps
)(TodoDetailView);

export default TodoDetailViewContainer;
