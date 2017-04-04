// view
var CardItemView = Backbone.View.extend({

  className: 'card',

  template: function() {
    return Handlebars.compile($('#card-template').html())
  },

  events: {
    'click .edit': 'edit',
  //  'keyup input': 'save'
    'hover': 'expand'
  },

  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },


  expand: function(){
    this.$el.css("border", "#red solid 1px");
  },

 //  save: function(event){
 //    if (event.which === 13){
 //      this.model.set('body', event.target.value);
 // //console.log(event.target);
 //    }
 //  },
 //
 //  hardify: function(){
 //    this.$el.find('input').show();
 //    this.$el.find('h2').hide();
 //  },

  render: function(){
    var html = this.template()(this.model.toJSON());
    this.$el.html(html);
    return this;
  }
});
