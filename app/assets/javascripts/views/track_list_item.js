TrackListItemView = Backbone.View.extend({
  el: '#track-list',
  template: '#trackListItemTemplate',
  changeStatus: function() {
    var statusIconClass = 'media-object glyphicon '
    switch(this.model.get('status')) {
      case 0:
        statusIconClass += 'glyphicon-record'
        break;
      case 1:
        statusIconClass += 'glyphicon-remove-circle'
        this.$barEl.parent().hide();
        break;
      case 2:
        statusIconClass += 'glyphicon-ok-circle'
        this.$barEl.parent().hide();
        break;
    }

    this.$itemEl.find('span').attr('class', statusIconClass);
    this.$itemEl.find('h4').text(this.model.get('artist'));
    this.$itemEl.find('h5').text(this.model.get('title'));
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)(this.model.toJSON());
    this.$el.append(html);
    this.$itemEl = this.$el.find('.media').last();
    this.$barEl = this.$itemEl.find('.progress-bar');
    this.changeStatus();
  },
  activate: function() {
    this.$itemEl.addClass('active');
    var self = this;

    this.model.on('change:status', function() {
      self.changeStatus.call(self);
    });

    this.$barEl.parent().fadeIn();
    game.bind('timeUpdate', this.timeUpdate, this);
  },
  deactivate: function() {
    this.$barEl.parent().fadeOut();
    this.$itemEl.removeClass('active');
    game.unbind('timeUpdate');
  },
  timeUpdate: function(total, elapsed) {
    this.$barEl.width(Math.round(elapsed / total * 100) + '%');
  }
});