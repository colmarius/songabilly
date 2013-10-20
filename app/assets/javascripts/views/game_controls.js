GameControlsView = Backbone.View.extend({
  el: '#game-controls',
  template: '#gameControlsTemplate',
  events: {
    'click #game-button': 'skipTrack'
  },
  status: 0,
  changeStatus: function() {
    var statusIconClass = 'glyphicon '
    switch(this.status) {
      case 0:
        statusIconClass += '.glyphicon glyphicon-off'
        break;
      case 1:
        statusIconClass += 'glyphicon glyphicon-download'
        break;
      case 2:
        statusIconClass += 'glyphicon glyphicon-refresh'
        break;
    }

    this.$el.find('.glyphicon').attr('class', statusIconClass);
    var labels = ['Start', 'Skip', 'Loading'];
    this.$el.find('.gameStatus').text(labels[this.status]);
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)();
    this.$el.append(html);

    game.on('resumeTimer', this.switchStatus, this);
    game.on('pauseTimer', this.switchStatus, this);
    this.changeStatus();
  },
  switchStatus: function() {
    statuses = [2, 2, 1];
    this.status = statuses[this.status];
    this.changeStatus();
  },
  skipTrack: function() {
    game.trigger('skipTrack');
  }
});