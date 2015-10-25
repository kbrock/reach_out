function hostname(url) {
  parser = document.createElement('a');
  parser.href = url;
  parser.href = parser.href;
  parser.protocol = parser.protocol.replace("http", "ws");
  return parser.href;
}
window.App = {};
App.cable = Cable.createConsumer(hostname("/"));
