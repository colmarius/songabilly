// var trackList = {
//   id: 'Titolo tracklist',
//   tracks: [{
//       id: '_1',
//       clip: 'http://previews.7digital.com/clips/34/16237034.clip.mp3',
//       answers: [{
//           artist: 'John Bon Jovi',
//           title: 'Lullabe'
//         }, {
//           artist: 'Pincopallo',
//           title: 'Che due palle'
//         }
//       ]
//     }
//   ]
// }

Game = function(options) {
  this.tracks = new TrackListItemsCollection(options.trackList.tracks);
  this.currentTrack = 0;
  this.currentClip = null;
  this.trackViews = [];
  this.timer = false;
  this.time = options.time || 60000;

  this.init();
  this.bindEvents();
}

Game.prototype.init = function() {
  // Game status
  this.gameStatus = new GameStatusView({});

  // Game controls
  this.gameControls = new GameControlsView({});

  // Track views
  var self = this;
  this.tracks.each(function(track) {
    var view = new TrackListItemView({
      model: track
    });

    self.trackViews.push(view);
  });

  // Answers view
  this.answersView = new GameAnswersView();

  // Events mixin
  _.extend(this, Backbone.Events);
}

Game.prototype.start = function() {
  this.gameStatus.render();
  this.gameControls.render();
  _.each(this.trackViews, function(view) {
    view.render();
  });
}

Game.prototype.bindEvents = function() {
  this.bind('skipTrack', this.skipTrack);
  this.bind('resumeTimer', this.resumeTimer);
  this.bind('pauseTimer', this.pauseTimer);
  this.bind('answersRendered', this.answersRendered);
  this.bind('answersRemoved', this.answersRemoved);
}

Game.prototype.skipTrack = function() {
  this.currentTrack += 1;
  if(this.currentTrack >= this.tracks.length) {
    this.currentTrack = 0;
  }

  this.trackTransition();
}

Game.prototype.trackTransition = function() {
  if(this.currentClip) {
    this.currentClip.stop();
  }
  this.answersView.remove();
}

Game.prototype.playTrack = function(index) {
  var track = this.tracks.at(index);
  var clip = track.get('clipSound');

  // Unbind events
  if(this.currentClip) {
    this.currentClip.stop();
    this.currentClip.unbind('play');
    this.currentClip.unbind('pause');
  }

  // Bind events
  this.currentClip = clip;

  this.currentClip.bind('play', function() {
    game.trigger('resumeTimer', this);
  });

  this.currentClip.bind('pause', function() {
    game.trigger('pauseTimer', this);
  });

  // Play clip
  clip.play();
}

Game.prototype.resumeTimer = function(clip) {
  var self = this;
  this.timer = setInterval(function() {
    self.timerTick();
  }, 1);
}

Game.prototype.pauseTimer = function() {
  clearInterval(this.timer);
  console.log('pausing', this.timer)
}

Game.prototype.timerTick = function() {
  this.time -= 1;
  this.trigger('timerTick', this.time);
}

Game.prototype.answersRendered = function() {
  this.playTrack(this.currentTrack);
}

Game.prototype.answersRemoved = function() {
  console.log(this.tracks.at(this.currentTrack))
  this.answersView = new GameAnswersView({
    model: this.tracks.at(this.currentTrack)
  });

  this.answersView.render();
}


var game;
