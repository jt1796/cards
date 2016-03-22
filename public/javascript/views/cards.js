var Cards = Backbone.View.extend({
  initialize: function() {
  },
  events: {

  },
  render: function() {
    $(this.el).html(cardsTemplate());
    return this;
  }
})
