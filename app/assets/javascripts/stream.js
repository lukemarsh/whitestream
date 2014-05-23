jQuery(function() {
  $(".dropdown-menu a").click(function() {
    var text = $(this).text();
    $(this).parents('.dropdown').find(".desc").html(text);
    $(this).parents('.dropdown-menu').prev().dropdown("toggle");
  });
  $('textarea').css('overflow', 'hidden').autogrow();
  $('.lightbox').click(function(e) {
    $('.modal-meme').attr('src', $(this).data('image').image.url);


    $('#like').html('<iframe src="//www.facebook.com/plugins/like.php?href=' + $(this).data('url') + '&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=false&amp;share=true&amp;height=21&amp;appId=568398906591962" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:21px;" allowTransparency="true"></iframe>');
    if (typeof FB !== 'undefined') {
        FB.XFBML.parse(document.getElementById('like'));
    }
    /*var toolbox = $('<div />').addClass('addthis_toolbox addthis_default_style addthis_20x20_style').attr('addthis:url', $(this).data('url')).attr('addthis:title', 'test'),
      services = {facebook: 'facebook', twitter: 'twitter', google: 'google', tumblr: 'tumblr', reddit: 'reddit'};

    for (var s in services) {
      toolbox.append('<a class="addthis_counter_'+s+' addthis_native_counter_parent">'+services[s]+'</a>');
    }

    $("#toolbox").html(toolbox);

    addthis.toolbox("#toolbox");*/


    $('#myModal').modal('show');
    e.preventDefault();
  });

  $("#carousel").owlCarousel({
    items: 4
  });

});