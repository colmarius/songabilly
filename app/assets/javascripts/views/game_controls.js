GameControlsView = Backbone.View.extend({
  el: '#game-controls',
  template: '#gameControlsTemplate',
  events: {
    'click #button-next': 'nextTrack'
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)();
    this.$el.append(html);
  },
  nextTrack: function() {
    game.trigger('skipTrack')
  }
});