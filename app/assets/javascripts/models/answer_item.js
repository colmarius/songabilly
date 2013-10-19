var AnswerItemModel = Backbone.Model.extend({
  defaults: {
    artist: '',
    title: ''
  }
});

var AnswerItemsCollection = Backbone.Collection.extend({
  model: AnswerItemModel
});