import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);

    this.state = { index: 0, baseTab: this.props.tabs[0]};
    this.tabs = this.props.tabs;
  }

  setBaseTab(tab) {
    this.setState({ baseTab: tab });
  }

  setTabTitles(tabs) {
    return this.tabs.map((tab, idx) => (
      <h1 key={idx} onClick={this.setBaseTab.bind(this, tab)}>
        {tab.title}
      </h1>
    ));
  }

  render() {
    let tabTitles = this.setTabTitles(this.tabs);
    let baseTab = this.state.baseTab;
    let content = baseTab.content;

    return (
      <div>
        <h2>Base Tab: {baseTab.title}</h2>
        <ul>{tabTitles}</ul>
        <p>{content}</p>
      </div>
    );
  }
}

export default Tabs;
