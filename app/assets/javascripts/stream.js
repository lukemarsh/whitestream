jQuery(function() {
  $(".dropdown-menu a").click(function() {
    var text = $(this).text();
    $(this).parents('.dropdown').find(".desc").html(text);
    $(this).parents('.dropdown-menu').prev().dropdown("toggle");
  });
  $('textarea').css('overflow', 'hidden').autogrow();
  $('.lightbox').click(function(e) {
    $('.modal-meme').attr('src', $(this).data('image').image.url);

    var toolbox = $('<div />').addClass('addthis_toolbox addthis_default_style addthis_20x20_style').attr('addthis:url', $(this).data('url')).attr('addthis:title', 'test'),
      services = {facebook: 'facebook', twitter: 'twitter', google: 'google', tumblr: 'tumblr', reddit: 'reddit'};

    for (var s in services) {
      toolbox.append('<a class="addthis_counter_'+s+' addthis_native_counter_parent">'+services[s]+'</a>');
    }

    $("#toolbox").html(toolbox);

    addthis.toolbox("#toolbox");


    $('#myModal').modal('show');
    e.preventDefault();
  });
});