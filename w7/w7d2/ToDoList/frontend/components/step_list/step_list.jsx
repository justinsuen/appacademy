import React from 'react';
import StepForm from './step_form';
import StepListItemContainer from './step_list_item_container';

const StepList = ({ steps, todo_id, createStep }) => {
  return (
    <div>
      <ul className="step-list">
        { steps.map(step => (
          <StepListItemContainer
            key={step.id}
            step={step}
            />))
        }
      </ul>
      <StepForm createStep={createStep} todo_id={todo_id}/>
    </div>
  );
};

export default StepList;
