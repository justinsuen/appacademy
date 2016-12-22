class DOMNodeCollection {
  constructor(nodes) {
    this.nodes = nodes;
  }

  each (cb) {
    for (let i = 0; i < this.nodes.length; i++) {
      cb(this.nodes[i]);
    }
  }

  html(html) {
    if (typeof html === 'string') {
      this.each(node => { node.innerHTML = html; });
    } else {
      if (this.nodes.length > 0) {
        return this.nodes[0].innerHTML;
      }
    }
  }

  empty() {
    this.html('');
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
      this.each(node => { node.innerHTML += content; });
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

  addClass(className) {
    this.each(node => node.classList.append(className));
  }

  removeClass(className) {
    this.each(node => node.classList.remove(className));
  }

  children(selector) {

  }

  parent(selector) {

  }

  find(selector) {

  }

  remove() {
    
  }
}

module.exports = DOMNodeCollection;
