jQuery(function() {
  $(".dropdown-menu a").click(function() {
    var text = $(this).text();
    $(this).parents('.dropdown').find(".desc").html(text);
    $(this).parents('.dropdown-menu').prev().dropdown("toggle");
  });
  $('.lightbox').click(function(e) {
    $('.modal-meme').attr('src', $(this).data('image').image.url);
    $('.fb-share-button, .fb-like, .g-plusone').attr('data-href', $(this).data('url'));
    $('.twitter-share-button').attr('data-url', $(this).data('url'));
    $('.tumblr-share-button').attr('href', 'http://www.tumblr.com/share/link?url=' + $(this).data('url'));
    $('#myModal').modal('show');
    e.preventDefault();
  });
});