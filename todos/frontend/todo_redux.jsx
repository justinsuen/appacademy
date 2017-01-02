import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import { allTodos } from './reducers/selectors';

window.store = configureStore();
window.allTodos = allTodos;

class Root extends React.Component {
  render() {
    return (
      <div>
        <h1>Hello!</h1>
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root/>, document.getElementById('content'));
});
