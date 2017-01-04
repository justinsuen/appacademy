import React from 'react';
import StepList from '../step_list/step_list';
import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
  componentDidMount() {
    this.props.requestSteps();
  }

  render() {
    let todo = this.props.todo;

    return (
      <div className="todo-detail-view">
        <div className="todo-body">{todo.body}</div>
        <StepListContainer todo_id={todo.id}/>
        <button onClick={ this.props.destroyTodo } className="delete">
          Delete
        </button>
      </div>
    );
  }
}

export default TodoDetailView;
