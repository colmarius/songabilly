GameControlsView = Backbone.View.extend({
  el: '#game-controls',
  template: '#gameControlsTemplate',
  events: {
    'click #game-button': 'switchStatus'
  },
  status: 0,
  changeStatus: function() {
    var statusIconClass = 'media-object glyphicon '
    switch(this.status) {
      case 0:
        statusIconClass += '.glyphicon glyphicon-off'
        break;
      case 1:
        statusIconClass += 'glyphicon glyphicon-play-circle'
        game.trigger('skipTrack');
        break;
      case 2:
        statusIconClass += 'glyphicon glyphicon-refresh'
        // game.trigger('pauseTimer');
        break;
    }

    this.$el.find('.glyphicon').attr('class', statusIconClass);
    var labels = ['Start', 'Playing', 'Loading'];
    this.$el.find('.gameStatus').text(labels[this.status]);
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)();
    this.$el.append(html);
    this.changeStatus();
  },
  switchStatus: function() {
    var statuses = [1, 2, 1];
    this.status = statuses[this.status];
    this.changeStatus();
  }
});