var Cards = Backbone.View.extend({
  initialize: function(m) {
    this.model = m;
    this.listenTo(this.model, 'sync', this.render);
  },
  events: {
    'click #cardCreateButton': 'createCard'
  },
  render: function() {
    $(this.el).html(cardsTemplate(this.processDeck()));
    return this;
  },
  processDeck: function() {
    var deck = {
      ready: [],
      progress: [],
      done: []
    };
    var data = this.model.models;
    for(var i = 0; i < data.length; i++) {
      var card = data[i].attributes;
      if(card.stack == 'ready') {
        deck.ready.push(card);
      }
      if(card.stack == 'progress') {
        deck.progress.push(card);
      }
      if(true) {

      }
    }
    return deck;
  },
  createCard: function(e) {
    e.preventDefault();
    alert('creating a card');
    //in this.model, add in a card to ready and sync
  }
})
