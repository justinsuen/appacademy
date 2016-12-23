class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();
    window.addEventListener('hashchange', () => {
      this.render();
    });
  }

  render() {
    let component = this.activeRoute();
    this.node.innerHTML = '';
    if (component) {
      this.node.appendChild(component.render());
    }
  }

  activeRoute() {
    let hash = window.location.hash.replace(/#/, '');
    return this.routes[hash];
  }
}

module.exports = Router;
