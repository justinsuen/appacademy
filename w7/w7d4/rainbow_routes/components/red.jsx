import React from 'react';
import { withRouter } from 'react-router';

class Red extends React.Component {
  constructor() {
    super();
    this.resetRed = this.resetRed.bind(this);
    this.addOrange = this.addOrange.bind(this);
    this.addYellow = this.addYellow.bind(this);
  }

  render() {
    return(
      <div>
        <h2 className="red"></h2>
        <h4 onClick={this.resetRed}>Red only</h4>
        <h4 onClick={this.addOrange}>Add orange</h4>
        <h4 onClick={this.addYellow}>Add yellow</h4>

        {this.props.children}
      </div>
    );
  }

  resetRed() {
    this.props.router.push('/red');
  }

  addOrange() {
    this.props.router.push('/red/orange');
  }

  addYellow() {
    this.props.router.push('/red/yellow');
  }
}

export default withRouter(Red);
