var CardsRouter = Backbone.Router.extend({
  execute: function(callback, args, name) {
    if(loggedIn) {
      if (callback) callback.apply(this, args);
      return;
    }
    $.when(this.checkIfLoggedIn()).done(function(res) {
      if(res) {
        loggedIn = true;
        if (callback) callback.apply(this, args);
      }else{
        router.navigate('login', {replace: true});
        this.login();
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

  },
  checkIfLoggedIn: function() {
    return $.ajax({
      url: '/username'
    }).done(function(data) {
      loggedIn = false;
      if(data !== ''){
        loggedIn = true;
      }
    });
  }
});
