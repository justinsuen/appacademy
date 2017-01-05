import React from 'react';

class ItemDetail extends React.Component {
  render() {
    const item = this.props.item;

    return(
      <li className="item-details">
        <h3>{item.name}</h3>
        <h3>{item.happiness}</h3>
        <h3>{item.price}</h3>
      </li>
    );
  }
}

export default ItemDetail;
