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
        break;
      case 2:
        statusIconClass += 'glyphicon-ok-circle'
        break;
    }

    this.$el.find('span').attr('class', statusIconClass);
  },
  render: function() {
    var $template = $(this.template).html();
    var html = _.template($template)(this.model.toJSON());
    this.$el.append(html);
    this.changeStatus();
  }
});