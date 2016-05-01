var CardsRouter = Backbone.Router.extend({
  routes: {
    "cards":        "cards",
    "card/:id":     "card"
  },
  cards: function() {

  },
  card: function(id) {

  }
});

Backbone.history.start({pushState: true});
