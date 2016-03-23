var Card = Backbone.Model.extend({
  url: '/card'
});

var Deck = Backbone.Collection.extend({
  url: '/cards',
  model: Card
});
