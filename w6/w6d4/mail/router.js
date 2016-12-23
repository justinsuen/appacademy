class Router {
  constructor(node) {
    this.node = node;
  }

  start() {
    this.render();
    window.addEventListener('hashchange', () => {
      this.render();
    });
  }

  render() {
    this.node.innerHTML = '';
    let route = this.activeRoute();
    let p = document.createElement('p');
    p.innerHTML = route;
    this.node.appendChild(p);
  }

  activeRoute() {
    return window.location.hash.replace(/#/, '');
  }
}

module.exports = Router;
