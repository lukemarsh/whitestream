jQuery(function() {

  $('textarea').css('overflow', 'hidden').autogrow();

  $("#thumbnails .meme").click(function(e) {
    $("#thumbnails .meme").removeClass('current');
    $(this).addClass('current');
    var image = $(this).find('img')[0].src;
    $("#left img").attr('src', image);
    e.preventDefault();
  });

});