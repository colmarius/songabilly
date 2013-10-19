var TrackListItemModel = Backbone.Model.extend({
  defaults: {
    artist: '',
    title: '',
    status: 0
  },
  initialize: function() {
    var clipSound = new buzz.sound(this.get('preview_url'), {
      preload: true
    });

    this.set('clipSound', clipSound);
  }
});

var TrackListItemsCollection = Backbone.Collection.extend({
  model: TrackListItemModel
});