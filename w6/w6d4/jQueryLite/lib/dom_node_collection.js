class DOMNodeCollection {
  constructor(nodes) {
    this.nodes = nodes;
  }

  nodesEachDo (cb) {
    for (let i = 0; i < this.nodes.length; i++) {
      cb(this.nodes[i]);
    }
  }

  html(html) {
    if (typeof html === 'string') {
      this.nodesEachDo(node => { node.innerHTML = html; });
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
      this.nodesEachDo(node => { node.innerHTML += content; });
    } else if (content instanceof DOMNodeCollection) {
      this.nodesEachDo(node => {
        content.nodesEachDo(childNode => {
          node.appendChild(childNode.cloneNode(true));
        });
      });
    }
  }
}

module.exports = DOMNodeCollection;
