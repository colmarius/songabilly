var QuizModel = Backbone.Model.extend({
  defaults: {
    valid_choices: [],
    artist: '',
    title: '',
    status: 0
  },
  initialize: function() {
    // console.log(this.get('audio_clip_url'));
    var clipSound = new buzz.sound(this.get('audio_clip_url'), {
      preload: true
    });

    this.set('clipSound', clipSound);
  }
});

var QuizCollection = Backbone.Collection.extend({
  model: QuizModel
});