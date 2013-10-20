GameControlsView = Backbone.View.extend({
  el: '#game-controls',
  template: '#gameControlsTemplate',
  events: {
    'click #button-play': 'firstTrack',
    'click #button-next': 'nextTrack'
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)();
    this.$el.append(html);
  },
  firstTrack: function() {
    game.trigger('firstTrack');
  },
  nextTrack: function() {
    game.trigger('skipTrack');
  }
});