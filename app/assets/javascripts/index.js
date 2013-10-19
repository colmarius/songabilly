$(document).ready(function() {
  $genres = $('.genre-selection');
  $genres.click(function() {
    $genres.removeClass('selected');
    $(this).addClass('selected');
    genre = $('.genre-selection.selected').data('genre');
    $('[name=genre]').val(genre);
  });
});