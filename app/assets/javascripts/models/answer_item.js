var AnswerItemModel = Backbone.Model.extend({
  // idAttribute: 'answer_id',
  url: function() {
    return '/api/track/' + this.get('track_id') + '/answer?check_id=' + this.get('answer_id');
  },
  defaults: {
    artist: '',
    title: ''
  }
});

var AnswerItemsCollection = Backbone.Collection.extend({
  model: AnswerItemModel,
});