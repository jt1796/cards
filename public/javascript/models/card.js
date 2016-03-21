var Card = Backbone.Model.extend({
  url: '/card'
});

var Cards = Backbone.Collection.extend({
  url: '/cards',
  model: Card
});
