jQuery(function() {
  $(".dropdown-menu a").click(function() {
    var text = $(this).text();
    $(this).parents('.dropdown').find(".desc").html(text);
    $(this).parents('.dropdown-menu').prev().dropdown("toggle");
    $(this).parent().siblings().removeClass('active');
    $(this).parent().addClass('active');
  });

  $('textarea').css('overflow', 'hidden').autogrow();

  $("#carousel").owlCarousel({
    items: 5,
    navigation: false,
    scrollPerPage: true
  });

});