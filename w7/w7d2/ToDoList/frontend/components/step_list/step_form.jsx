import React from 'react';
import { uniqueId } from '../../util/util.js';
import merge from 'lodash/merge';

class StepForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = { id: "", title: "", done: false, todo_id: this.props.todo_id };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    this.setState({ title: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();

    let newStep = merge({}, this.state);
    newStep.id = uniqueId();

    this.props.createStep(this.props.todo_id, newStep);
    this.setState({ id: "", title: "", done: false });
  }

  render() {
    return (
      <form className="step-form"
        onSubmit={this.handleSubmit}>
        <label>
          Title:
          <input
            name="title"
            type="text"
            value={this.state.title}
            onChange={this.handleChange}
            />
        </label>
        <input type="submit" value="Create Step!" />
      </form>
    );
  }
}

export default StepForm;
