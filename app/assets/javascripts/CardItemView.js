// view


var CardItemView = Backbone.View.extend({

  className: 'card',

  // changing the root element - tag name/ adding classes
  //tagName: '<span>',
  //className:

  template: Handlebars.compile($('#card-template').html()),

  events: {
    'click': 'hardify',
    'keyup input': 'save'
  },

// new QuoteItemView calls initialize
// in this case 'this' acts like self
  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },


  save: function(event){
    if (event.which === 13){
      this.model.set('body', event.target.value);
 //console.log(event.target);
    }
  },

  hardify: function(){
    this.$el.find('input').show();
    this.$el.find('h2').hide();
  },

  render: function(){
    var html = this.template(this.model.toJSON());
    this.$el.html(html);
    return this;
  }
})
