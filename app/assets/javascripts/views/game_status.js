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
    this.$secondsEl = this.$el.find('h1').children('.seconds');
    this.$millisecondsEl = this.$el.find('h1').children('.milliseconds');
    this.$answerCount = this.$el.find('span.resume');
    game.bind('timerTick', this.updateTime, this);
    game.bind('answerConfirmed', this.updateAnswerCounter, this);
  },
  updateTime: function(time) {
    var date = new Date(time);
    this.$secondsEl.text(date.getSeconds())
    this.$millisecondsEl.text(date.getMilliseconds())
  },
  updateAnswerCounter: function(answerCount, trackCount) {
    this.$answerCount.text(answerCount + '/' + trackCount);
  }
});