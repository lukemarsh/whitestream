jQuery(function() {
  $(".dropdown-menu a").click(function() {
    var text = $(this).text();
    $(this).parents('.dropdown').find(".desc").html(text);
  });
});