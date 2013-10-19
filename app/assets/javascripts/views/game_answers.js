GameAnswersView = Backbone.View.extend({
  el: '#game-answers',
  template: '#gameAnswersTemplate',
  events: {
    // 'click #button-next': 'nextTrack'
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)(this.model.toJSON());
    this.$el.append(html);
    this.$el.animate({
      bottom: 0
    }, 500, function() {
      game.trigger('answersRendered');
    });
  },
  remove: function() {
    var self = this;
    this.$el.animate({
      bottom: -200
    }, 500, function() {
      self.$el.empty();
      game.trigger('answersRemoved');
    });
  }
});