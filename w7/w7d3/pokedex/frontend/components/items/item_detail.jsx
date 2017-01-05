import React from 'react';

class ItemDetail extends React.Component {
  render() {
    const item = this.props.item;

    return(
      <div className="item-details">
        <h3>{item.name}</h3>
        <h3>Happiness: {item.happiness}</h3>
        <h3>Price: {item.price}</h3>
      </div>
    );
  }
}

export default ItemDetail;
