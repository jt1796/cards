var Root = Backbone.View.extend({
  views: {},
  models: {},
  initialize: function() {
    this.listenTo(eventNeo, 'loggedIn', this.handleLogin);
    this.models.deck = new Deck();
    this.views.login = new Login();
    this.views.cards = new Cards(this.models.deck);
  },
  events: {
  },
  render: function() {
    this.$el.append(this.views.login.$el);
    this.views.login.render();
    return this;
  },

  handleLogin: function() {
    this.models.deck.fetch();
    this.views.login.remove();
    this.$el.append(this.views.cards.$el);
    this.views.cards.render();
  }
})
