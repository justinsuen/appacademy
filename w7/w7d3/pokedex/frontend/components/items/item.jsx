import React from 'react';

class Item extends React.Component {
  render() {
    const item = this.props.item;

    return(
      <li className="item">
        <img src={`${item.image_url}`} />
      </li>
    );
  }
}

export default Item;
