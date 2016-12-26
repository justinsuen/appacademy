import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);

    this.state = { index: 0, baseTab: this.props.tabs[0]};
    this.tabs = this.props.tabs;
  }

  setBaseTab(tab, idx) {
    this.setState({ index: idx, baseTab: tab });
  }

  setTabTitles(tabs) {
    return this.tabs.map((tab, idx) => (
      <h1 key={idx}
        className={this.state.index === idx ? "bold" : ""}
        onClick={this.setBaseTab.bind(this, tab, idx)}>
        {tab.title}
      </h1>
    ));
  }

  render() {
    let tabTitles = this.setTabTitles(this.tabs);
    let baseTab = this.state.baseTab;
    let content = baseTab.content;

    return (
      <div className="tabs">
        <ul>{tabTitles}</ul>
        <div className="content">
          {content}
        </div>
      </div>
    );
  }
}

export default Tabs;
