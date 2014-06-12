jQuery(function() {
  $('.best_in_place').best_in_place();
  $("#remix").click(function() {
    window.location = 'new?raw_image=' + $(this).data('image') + '&top_line=' + $('#topText').val() + '&bottom_line=' + $('#bottomText').val() + '&colour=' + $(this).data('colour').replace("#", "");
  });
});