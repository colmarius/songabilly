var AnswerItemModel = Backbone.Model.extend({
  idAttribute: 'answer_id',
  defaults: {
    artist: '',
    title: ''
  }
});

var AnswerItemsCollection = Backbone.Collection.extend({
  model: AnswerItemModel
});