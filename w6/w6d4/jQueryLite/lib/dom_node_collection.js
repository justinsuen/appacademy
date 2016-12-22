class DOMNodeCollection {
  constructor(nodes) {
    this.nodes = nodes;
  }

  addClass(className) {
    this.each(node => node.classList.append(className));
  }

  append(content) {
    if (this.nodes.length === 0) {
      return;
    }

    if ((typeof content === 'object') &&
    !(content instanceof DOMNodeCollection)) {
      content = $(content);
    }

    if (typeof content === 'string') {
      this.each(node => {
        node.innerHTML += content;
      });
    } else if (content instanceof DOMNodeCollection) {
      this.each(node => {
        content.each(childNode => {
          node.appendChild(childNode.cloneNode(true));
        });
      });
    }
  }

  attr(key, val) {
    if (typeof val === 'string' || typeof val === 'number') {
      this.each(node => node.setAttribute(key, val));
    } else {
      return this.nodes[0].getAttribute(key);
    }
  }

  children() {
    let childNodes = [];
    this.each(node => {
      childNodes = childNodes.concat(Array.from(node.childNodes));
    });
    return new DOMNodeCollection(childNodes);
  }

  each(cb) {
    for (let i = 0; i < this.nodes.length; i++) {
      cb(this.nodes[i]);
    }
  }

  empty() {
    this.html('');
  }

  find(selector) {
    let foundNodes = [];
    this.each(node => {
      let nodeList = node.querySelectorAll(selector);
      foundNodes = foundNodes.concat(Array.from(nodeList));
    });
    return new DOMNodeCollection(foundNodes);
  }

  html(html) {
    if (typeof html === 'string') {
      this.each(node => {
        node.innerHTML = html;
      });
    } else {
      if (this.nodes.length > 0) {
        return this.nodes[0].innerHTML;
      }
    }
  }

  off(event) {
    const evKey = `jqliteEvent-${event}`;

    this.each(node => {
      if (node[evKey]) {
        node[evKey].forEach(cb => node.removeEventListener(event, cb));
      }
      delete node[evKey];
    });
  }

  on(event, cb) {
    const evKey = `jqliteEvent-${event}`;

    this.each(node => {
      node.addEventListener(event, cb);
      if (node[evKey] === undefined) {
        node[evKey] = [];
      }
      node[evKey].push(cb);
    });
  }

  parent() {
    let parentNodes = [];
    this.each(node => parentNodes.push(node.parentNode));
    return new DOMNodeCollection(parentNodes);
  }

  remove() {
    this.each(node => node.parentNode.removeChild(node));
  }

  removeClass(className) {
    this.each(node => node.classList.remove(className));
  }
}

module.exports = DOMNodeCollection;
