import React from 'react';
import StepList from '../step_list/step_list';
import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);

    this.handleDelete = this.handleDelete.bind(this);
  }

  handleDelete (e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  render() {
    let todo = this.props.todo;

    return (
      <div>
        <div>{todo.body}</div>
        <StepListContainer todoId={todo.id}/>
        <button onClick={this.handleDelete}>
          Delete Todo
        </button>
      </div>
    );
  }
}

export default TodoDetailView;
