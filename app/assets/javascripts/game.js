var trackList = {
  id: 'Titolo tracklist',
  tracks: [{
      id: '_1',
      clip: 'http://previews.7digital.com/clips/34/16237034.clip.mp3',
      answers: [{
          author: 'John Bon Jovi',
          title: 'Lullabe'
        }, {
          author: 'Pincopallo',
          title: 'Che due palle'
        }
      ]
    }
  ]
}

var TrackListItemModel = Backbone.Model.extend({
  defaults: {
    artist: '',
    title: '',
    status: 0
  },
  initialize: function() {
    var clipSound = new buzz.sound(this.get('clip'), {
      preload: true
    });

    this.set('clipSound', clipSound);
  }
});

var TrackListItemsCollection = Backbone.Collection.extend({
  model: TrackListItemModel
});

var TrackListItemView = Backbone.View.extend({
  el: '#track-list',
  template: $('#trackListItemTemplate').html(),
  changeStatus: function() {
    var statusIconClass = 'media-object glyphicon '
    switch(this.model.get('status')) {
      case 0:
        statusIconClass += 'glyphicon-record'
        break;
      case 1:
        statusIconClass += 'glyphicon-remove-circle'
        break;
      case 2:
        statusIconClass += 'glyphicon-ok-circle'
        break;
    }

    this.$el.find('span').attr('class', statusIconClass);
  },
  render: function() {
    var html = _.template(this.template)(this.model.toJSON());
    this.$el.append(html);
    this.changeStatus();
  }
});

var GameStatusView= Backbone.View.extend({
  el: '#game-status',
  template: $('#gameStatusTemplate').html(),
  render: function() {
    var html = _.template(this.template)();
    this.$el.append(html);
  }
});

Game = function(options) {
  this.tracks = new TrackListItemsCollection(options.trackList.tracks);
  this.trackViews = [];

  this.init();
}

Game.prototype.init = function() {
  // Game status view
  this.gameStatusView = new GameStatusView({});
  this.gameStatusView.render();

  // Track views
  var self = this;
  this.tracks.each(function(track) {
    var view = new TrackListItemView({
      model: track
    });

    view.render();
    self.trackViews.push(view);
  });
}

var game = new Game({
  trackList: trackList
});