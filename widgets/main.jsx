import React from 'react';
import Tabs from './tabs';

const tab0 = {title: "Tab 0", content: "Stuff 0"};
const tab1 = {title: "Tab 1", content: "Stuff 1"};
const tab2 = {title: "Tab 2", content: "Stuff 2"};

class Main extends React.Component {
  constructor() {
    super();
    this.state = {tabs: [tab0, tab1, tab2]};
  }

  render() {
    return (
      <div>
        < Tabs tabs={this.state.tabs}/>
      </div>
    );
  }
}

export default Main;
