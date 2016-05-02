var eventNeo = {};
var router;
var loggedIn = false;

$(document).ready(function() {
  _.extend(eventNeo, Backbone.Events);
  router = new CardsRouter();
  Backbone.history.start();
});
