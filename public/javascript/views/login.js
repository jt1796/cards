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
    $.ajax({
      url: '/login',
      method: 'POST',
      data: {
        username: $('#loginUsername').val(),
        password: $('#loginPassword').val()
      },
      success: function(response) {
        remove();
      }
    });
  }
})
