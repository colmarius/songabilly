GameStatusView = Backbone.View.extend({
  el: '#game-status',
  template: '#gameStatusTemplate',
  initialize: function(options) {
    this.genre = options.genre;
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)({genre: this.genre});
    this.$el.append(html);
    this.$timerEl = this.$el.find('h1');
    game.bind('timerTick', this.updateTime, this);
  },
  updateTime: function(time) {
    var date = new Date(time);
    this.$timerEl.text(date.getSeconds() + ':' + date.getMilliseconds())
  }
});