var Login = Backbone.View.extend({
  initialize: function() {
  },
  events: {
    'click #loginButton': 'submitLogin'
  },
  render: function() {
    $(this.el).html(loginTemplate());
    return this;
  },

  submitLogin: function(e) {
    alert('clicked');
  }
})
