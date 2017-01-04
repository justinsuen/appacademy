import React from 'react';

class StepListItem extends React.Component {
  constructor(props) {
    super(props);

    this.handleUpdate = this.handleUpdate.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
  }

  handleUpdate (e) {
    e.preventDefault();
    this.props.step.done = (this.props.step.done === true) ? false : true;
    this.props.updateStep(this.props.step);
  }

  handleDelete (e) {
    e.preventDefault();
    this.props.destroyStep(this.props.step);
  }

  render() {
    let step = this.props.step;

    return (
      <li className="step-item">
        <div className="step-text">
          <div>
            { step.title }
          </div>
          <div>
            <button onClick={this.handleUpdate} className={step.done === true ? "undo" : "done"}>
              {step.done === true ? "Undo" : "Done"}
            </button>
            <button onClick={this.handleDelete} className="delete">
              Delete
            </button>
          </div>
        </div>
      </li>
    );
  }
}

export default StepListItem;
