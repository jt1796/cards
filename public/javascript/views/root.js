var Root = Backbone.View.extend({
  views: {},
  initialize: function() {
    this.listenTo(eventNeo, 'loggedIn', this.handleLogin);
    this.views.login = new Login();
  },
  events: {
  },
  render: function() {
    this.$el.append(this.views.login.$el);
    this.views.login.render();
    return this;
  },

  handleLogin: function() {
    this.views.login.remove();
    this.$el.html('logged in');
  }
})
