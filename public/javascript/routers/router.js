var CardsRouter = Backbone.Router.extend({
  execute: function(callback, args, name) {
    var that = this;
    if(loggedIn) {
      if (callback) callback.apply(this, args);
    }
    $.when($.ajax("/username")).done(function(data) {
      if(data !== '') {
        loggedIn = true;
        if (callback) callback.apply(this, args);
      }else{
        router.navigate('login', {replace: true});
        that.login();
      }
    });
  },
  routes: {
    "login":        "login",
    "cards":        "cards",
    "card/:id":     "card",
    "":             "cards"
  },
  login: function() {
    var loginView = new Login({el: $('#root')});
    loginView.render();
  },
  cards: function() {
    var CardsView = new Cards({el: $('#root')});
    CardsView.render();
  },
  card: function(id) {

  }
});
