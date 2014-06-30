$(function() {
  $.setAjaxPagination = function() {
    return $('#pagination a').click(function(event) {
      var loading;
      event.preventDefault();
      loading = $('<div id="loading" style="display: none;"><span class="glyphicon glyphicon-refresh spin"></span></div>');
      $('#reload').prepend(loading);
      loading.show();
      $.ajax({
        type: 'GET',
        url: $(this).attr('href'),
        dataType: 'script',
        success: (function() {
          return loading.fadeOut(function() {
            return loading.remove();
          });
        })
      });
      return false;
    });
  };
  return $.setAjaxPagination();
});