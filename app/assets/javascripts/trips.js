var QuoteItemView = Backbone.View.extend({
  template: Handlebars.compile($('#new_card_form').html()),
  events: {
    'click .new_card_action': 'showCardForm'
  },
  showCardForm: function(){
    this.$el.find('p').css('text-decoration','line-through');
  },
  render: function(){
    // var source = $('#quote-item-template').html()
    // var template = Handlebars.compile(source);
    var html = this.template(this.model);
    this.$el.html(html);
  }
});

$('#create_new_card').on('click',function(){
  var view = new QuoteItemView()
  view.render();
  $('#new_card_container').append(view.el)
})
