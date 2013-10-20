GameEndingView = Backbone.View.extend({
  el: 'body',
  template: '#gameEndingTemplate',
  render: function(parent) {
    var $template = $(this.template).html();
    var html = _.template($template)(this.model);

    this.$el.append(html);
  }
});