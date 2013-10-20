$(document).ready(function() {
  $('[name=genre]').typeahead({
    name: 'trends' + Math.random(),
    prefetch: '/api/genres.json',
    valueKey: 'name',
    limit: 10
  });
});