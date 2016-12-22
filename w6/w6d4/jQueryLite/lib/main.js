const DOMNodeCollection = require("./dom_node_collection.js");

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
