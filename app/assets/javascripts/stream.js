jQuery(function() {
  $(".dropdown-menu a").click(function() {
    var text = $(this).text();
    $(this).parents('.dropdown').find(".desc").html(text);
    $(this).parents('.dropdown-menu').prev().dropdown("toggle");
  });
  $(".test").click(function(e) {
    $("#myModal img").attr('src', $(this).attr('data-img'));
  });
});