var eventNeo = {};
var router;

$(document).ready(function() {
  router = new CardsRouter();
  router.navigate('#testing');
  _.extend(eventNeo, Backbone.Events);
  var root = new Root({el: $('#root')});
  root.render();
});
