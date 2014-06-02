jQuery(function() {
  $(".dropdown-menu a").click(function() {
    var text = $(this).text();
    $(this).parents('.dropdown').find(".desc").html(text);
    $(this).parents('.dropdown-menu').prev().dropdown("toggle");
  });
  $('textarea').css('overflow', 'hidden').autogrow();
  $('.lightbox').click(function(e) {
    $('.modal-meme').attr('src', $(this).data('image').image.url);


    $('.modal-body #like').html('<iframe src="//www.facebook.com/plugins/like.php?href=' + $(this).data('url') + '&amp;width&amp;layout=button_count&amp;action=like&amp;show_faces=false&amp;share=true&amp;height=21&amp;appId=568398906591962" scrolling="no" frameborder="0" style="border:none; overflow:hidden; height:21px;" allowTransparency="true"></iframe>');
    $('.modal-body #tweet').html('<a href="https://twitter.com/share" class="twitter-share-button" data-url="' + $(this).data('url') + '" data-text="This is fun">Tweet</a>');
    $('.modal-body #plusone').html('<div class="g-plusone" data-size="medium" data-href="' + $(this).data('url') + '"></div>');

    var tumblr_button = document.createElement("a");
    tumblr_button.setAttribute("href", "http://www.tumblr.com/share/link?url=" + $(this).data('url').replace("http://", "") + "&name=test&description=test");
    tumblr_button.setAttribute("title", "Share on Tumblr");
    tumblr_button.setAttribute("style", "display:inline-block; text-indent:-9999px; overflow:hidden; width:81px; height:20px; background:url('http://platform.tumblr.com/v1/share_1.png') top left no-repeat transparent;");
    tumblr_button.innerHTML = "Share on Tumblr";
    $(".modal-body #tumblr").html(tumblr_button);

    var oScript = document.createElement("script");
    document.write = function(text) {
      $(".modal-body #reddit").html(text);
    };
    oScript.src = "http://www.reddit.com/buttonlite.js?i=5&url=" + $(this).data('url');
    document.body.appendChild(oScript);

    if (typeof FB !== 'undefined') {
      FB.XFBML.parse(document.getElementById('like'));
    }
    twttr.widgets.load();
    gapi.plusone.go();


    $('#myModal').modal('show');
    e.preventDefault();
  });

  $("#carousel").owlCarousel({
    items: 4
  });

});