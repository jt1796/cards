var CardsRouter = Backbone.Router.extend({
  // execute: function(callback, args, name) {
  //   $.ajax({
  //     url: '/username',
  //   }).done(function(data) {
  //     console.log("checking if logged in");
  //     if(data === '') {
  //       console.log("you are not logged in");
  //       router.navigate('login', {trigger: true});
  //     }
  //   });
  // },
  routes: {
    "login":        "login",
    "cards":        "cards",
    "card/:id":     "card"
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
