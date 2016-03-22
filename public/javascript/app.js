var eventNeo = {};

$(document).ready(function() {
  _.extend(eventNeo, Backbone.Events);
  var root = new Root({el: $('#root')});
  root.render();
});
