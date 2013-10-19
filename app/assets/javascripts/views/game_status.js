GameStatusView = Backbone.View.extend({
  el: '#game-status',
  template: '#gameStatusTemplate',
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)();
    this.$el.append(html);
    this.$timerEl = this.$el.find('h1');
    console.log(this.$timerEl)
    game.bind('timerTick', this.updateTime, this);
  },
  updateTime: function(time) {
    var date = new Date(time);
    this.$timerEl.text(date.getSeconds() + ':' + date.getMilliseconds())
  }
});