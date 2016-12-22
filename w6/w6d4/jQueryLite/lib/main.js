const DOMNodeCollection = require("./dom_node_collection.js");

// $l(HTMLElement) - selects the element in arg given a CSS selector
window.$l = arg => {
  let argsList;
  if (arg instanceof HTMLElement) {
    argsList = [arg];
  } else {
    let nodeList = document.querySelectorAll(arg);
    argsList = Array.from(nodeList);
  }

  return new DOMNodeCollection(argsList);
};
