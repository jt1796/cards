var CardsRouter = Backbone.Router.extend({
  execute: function(callback, args, name) {
    console.log("loggedIn : " + loggedIn);
    if(loggedIn){
      if (callback) callback.apply(this, args);
    } else {
      router.navigate('login', {replace: true});
      this.login();
      return false;
    }
  },
  routes: {
    "login":        "login",
    "cards":        "cards",
    "card/:id":     "card",
    "":             "cards"
  },
  login: function() {
    console.log("routing to login");
    var loginView = new Login({el: $('#root')});
    loginView.render();
  },
  cards: function() {
    console.log("routing to cards");
    var CardsView = new Cards({el: $('#root')});
    CardsView.render();
  },
  card: function(id) {

  }
});
