$(document).ready(function() {
  $('[name=genre]').typeahead({
    name: 'trends' + Math.random(),
    prefetch: '/api/genres.json',
    limit: 10
  });
});