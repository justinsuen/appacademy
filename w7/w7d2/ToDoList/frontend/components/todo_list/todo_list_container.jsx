import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import { receiveTodo, removeTodo, requestTodos, createTodo } from '../../actions/todo_actions';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  requestTodos: () => dispatch(requestTodos()),
  createTodo: (todo) => dispatch(createTodo(todo))
});


const TodoListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

export default TodoListContainer;
