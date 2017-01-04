import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import { requestTodos, createTodo, updateTodo } from '../../actions/todo_actions';

const mapStateToProps = state => {
  return {
    todos: allTodos(state),
    errors: state.errors
  };
};

const mapDispatchToProps = dispatch => {
  return {
    requestTodos: () => dispatch(requestTodos()),
    createTodo: (todo) => dispatch(createTodo(todo)),
    updateTodo: (todo) => dispatch(updateTodo(todo)),
  };
};


const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export default TodoListContainer;
