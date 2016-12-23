const DOMNodeCollection = require("./dom_node_collection.js");

const _docReadyCallbacks = [];
let _docReady = false;

window.$l = arg => {
  let argsList;
  if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  } else if (typeof arg === 'function') {
    return registerDocReadyCallback(arg);
  } else {
    let nodeList = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(nodeList));
  }
};

window.$l.extend = (base, ...otherObjs) => {
  otherObjs.forEach(obj => {
    for (let prop in obj) {
      base[prop] = obj[prop];
    }
  });
  return base;
};

window.$l.ajax = options => {
  const request = new XMLHttpRequest();
  const defaults = {
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    method: "GET",
    url: "",
    success: () => {},
    error: () => {},
    data: {}
  };

  options = window.$l.extend(defaults, options);
  options.method = options.method.toUpperCase();

  if (options.method === "GET") {
    options.url += "?" + toQueryString(options.data);
  }

  request.open(options.method, options.url, true);
  request.onload = e => {
    if (request.status === 200) {
      options.success(request.response);
    } else {
      options.error(request.response);
    }
  };

  request.send(JSON.stringify(options.data));
};

//helper methods
const toQueryString = obj => {
  let result = "";
  for (let prop in obj) {
    if (obj.hasOwnProperty(prop)) {
      result += prop + "=" + obj[prop] + "&";
    }
  }
  return result.substring(0, result.length - 1);
};

const registerDocReadyCallback = func => {
  if (!_docReady) {
    _docReadyCallbacks.push(func);
  } else {
    func();
  }
};

document.addEventListener('DOMContentLoaded', () => {
  _docReady = true;
  _docReadyCallbacks.forEach(func => func());
});
