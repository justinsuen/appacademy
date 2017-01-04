import React from 'react';
import StepForm from './step_form';
import StepListItemContainer from './step_list_item_container';

// class StepList extends React.Component {
//   constructor(props) {
//     super(props);
//   }

const StepList = ({ steps, todo_id, createStep }) => {
  return (
    <div>
      <ul className="step-list">
        { this.props.steps.map(step => (
          <StepListItemContainer
            key={step.id}
            step={step}
            />))
        }
      </ul>
      <StepForm createStep={this.props.createStep} todoId={this.props.todoId}/>
    </div>
  );
};

export default StepList;
