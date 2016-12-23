const MessageStore = require('./message_store.js');

module.exports = {
  render() {
    let ul = document.createElement('ul');
    ul.className = 'messages';

    let messages = MessageStore.getInboxMessages();
    messages.forEach((msg) => {
      ul.appendChild(this.renderMessage(msg));
    });

    return ul;
  },

  renderMessage(message) {
    let li = document.createElement('li');
    li.className = 'message';

    li.innerHTML = `
    <span class='from'>${message.from}</span>
    <span class="subject">${message.subject}</span> -
    <span class="body">${message.body}</span>
    `;

    return li;
  }
};
