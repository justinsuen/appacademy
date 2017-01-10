import React from 'react';
import { withRouter } from 'react-router';

class ReviewButton extends React.Component{
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    const benchId = this.props.benchId;
    const url = `/benches/${benchId}/review`;
    this.props.router.push(url);
  }

  render() {
    return (
      <button
        className="review-button"
        onClick={this.handleClick}>
        Leave a Review
      </button>
    );
  }
};

export default withRouter(ReviewButton);
