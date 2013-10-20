GameAnswerView = Backbone.View.extend({
  el: '#answers-list',
  template: '#gameAnswerTemplate',
  render: function(parent) {
    var $template = $(this.template).html();
    var html = _.template($template)(this.model.toJSON());

    this.$el.append(html);
    this.$itemEl = this.$el.find('.panel-body').last();
    this.$itemEl.attr('data-cid', this.model.cid);
  }
});