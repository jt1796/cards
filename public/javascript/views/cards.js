var Cards = Backbone.View.extend({
  initialize: function() {
    this.model = new Deck();
    this.listenTo(this.model, 'sync', this.render);
    this.model.fetch();
    eventNeo.on('showCard', this.showCard);
  },
  events: {
    'click #cardCreateButton': 'createCard'
  },
  render: function() {
    $(this.el).html(cardsTemplate(this.processDeck()));
    this.addEvents();
    this.$el = $(this.el);
    return this;
  },
  addEvents: function() {
    var data = this.model.models;
    var that = this;
    for(var i = 0; i < data.length; i++) {
      (function() {
        var card = data[i].attributes;
        $('#card-' + card.id).click(function() {eventNeo.trigger('showCard', card, that)} );
      }());
    }
  },
  showCard: function(card, that) {
    cardView = new Card(card);
    cardView.render();
    that.$el.html(cardView.$el.html());
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
      card.id = i;
      if(card.stack == 'ready') {
        deck.ready.push(card);
      } else if (card.stack == 'progress') {
        deck.progress.push(card);
      } else {
        deck.done.push(card);
      }
    }
    return deck;
  },
  createCard: function(e) {
    e.preventDefault();
    this.model.create({
      username: 'x',
      stack: 'ready',
      title: $('#cardTitle').val(),
      body: $('#cardBody').val(),
      acceptance: $('#cardAcceptance').val()
    });
  }
})
