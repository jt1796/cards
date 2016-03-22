var Login = Backbone.View.extend({
  initialize: function() {
  },
  events: {
    'click #loginButton': 'submitLogin',
    'click #createAccountButton': 'createAccount'
  },
  render: function() {
    $(this.el).html(loginTemplate());
    return this;
  },

  submitLogin: function(e) {
    e.preventDefault();
    $.ajax({
      url: '/login',
      method: 'POST',
      data: {
        username: $('#loginUsername').val(),
        password: $('#loginPassword').val()
      },
      success: function(response) {
        eventNeo.trigger("loggedIn", $('#loginUsername').val());
      }
    });
  },

  createAccount: function(e) {
    e.preventDefault();
    $.ajax({
      url: '/newaccount',
      method: 'POST',
      data: {
        username: $('#loginUsername').val(),
        password: $('#loginPassword').val()
      },
      success: function() {
      }
    });
  }
})
