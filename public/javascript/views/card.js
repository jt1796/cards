var Card = Backbone.View.extend({
  initialize: function(m){
    this.model = m;
  },
  render: function(){
    $(this.el).html(cardTemplate(this.model));
    return this;
  }
});
