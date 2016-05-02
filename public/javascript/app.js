var eventNeo = {};
var router;

$(document).ready(function() {
  _.extend(eventNeo, Backbone.Events);
  router = new CardsRouter();
  console.log("initial URL match router : " + Backbone.history.start());
  console.log(Backbone.history);
});
