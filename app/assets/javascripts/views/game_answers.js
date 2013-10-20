GameAnswersView = Backbone.View.extend({
  el: '#game-answers',
  template: '#gameAnswersTemplate',
  events: {
    'click .panel-body': 'answerSelected'
  },
  initialize: function() {
    this.answerViews = [];
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)(this.model.toJSON());

    this.$el.html(html);

    // Render answer views
    var self = this;
    game.currentAnswers.each(function(answer) {
      var answerView = new GameAnswerView({
        model: answer
      });

      answerView.render();
      self.answerViews.push(answerView);
    });

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
  },
  answerSelected: function(e) {
    $answerEl = $(e.currentTarget);
    game.trigger('answerSelected', this.model, $answerEl.data('cid'));
  }
});