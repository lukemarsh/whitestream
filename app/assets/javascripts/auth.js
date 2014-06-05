jQuery(function () {
  $('body').on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
  });
  $('body').on('shown.bs.modal', '.modal', function () {
    $('.modal-content a').click(function () {
      var modalToOpen = $(this).data('target');
      $('.modal').not(modalToOpen).modal('hide');
    });
    $("#continue").on('click', function () {
      $("#download").trigger("click", "continueSubmission");
    });
  });
});