var AnswerItemModel = Backbone.Model.extend({
  // idAttribute: 'answer_id',
  urlRoot: function() {
    return '/api/track/' + this.get('answer_id') + '/answer';
  },
  defaults: {
    artist: '',
    title: ''
  }
});

var AnswerItemsCollection = Backbone.Collection.extend({
  model: AnswerItemModel,
});