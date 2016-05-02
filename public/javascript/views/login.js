var Login = Backbone.View.extend({
  initialize: function(el) {
    this.$el = el;
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
        loggedIn = true;
        console.log("set logged in. Fixing to route");
        router.navigate('#cards', {trigger: true});
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
