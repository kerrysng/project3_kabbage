var MoodboardCardItemView = Backbone.View.extend({

  className: 'card',

  template: function() {
    return Handlebars.compile($('#moodboard-card-template').html())
  },

  events: {

   'click .image': 'toggleContent',
  //  'click .edit': 'editForm'
  },

  showmeState: false,


  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
  },

  // editForm: function(){
  //   this.$el.find('.notedit').hide();
  //   this.$el.find('.isedit').show();
  // },

  toggleContent: function(){
    if (this.showmeState === false) {
      this.showText();
    } else {
      this.hideText();
    };
  },

  hideText: function() {
   this.$el.find('.moodboard').hide();
   this.showmeState = false;
   this.$el.removeClass( "full_view" );
  },

  showText: function() {
   this.$el.find('.moodboard').show();
   this.showmeState = true;
   this.$el.addClass( "full_view" );
  },

  render: function(){
    var html = this.template()(this.model.toJSON());
    this.$el.html(html);
    this.hideText();
    // this.$el.find('.isedit').hide();
    return this;
  }
});
