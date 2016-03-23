var Cards = Backbone.View.extend({
  initialize: function(m) {
    this.model = m;
    this.listenTo(this.model, 'sync', this.render);
  },
  events: {

  },
  render: function() {
    console.log(this.model.models);
    $(this.el).html(cardsTemplate({model: this.model.models}));
    return this;
  }
})
