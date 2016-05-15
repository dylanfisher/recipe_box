$(document).on('click', '[data-background-color]', function() {
  var $color = $(this);
  var $colors = $color.closest('.user-edit__box-background-colors').find('.user-edit__box-background-color');
  var hex = $color.attr('data-background-color');

  $colors.removeClass('active');
  $color.addClass('active');

  $('body').css({ backgroundColor: hex });

  $('#user_box_attributes_background_color').val(hex);
});
