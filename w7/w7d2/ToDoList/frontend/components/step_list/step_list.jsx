import React from 'react';
import StepForm from './step_form';
import StepListItemContainer from './step_list_item_container';

const StepList = ({ steps, todoId, createStep }) => {
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
      <StepForm createStep={createStep} todoId={todoId}/>
    </div>
  );
};

export default StepList;
