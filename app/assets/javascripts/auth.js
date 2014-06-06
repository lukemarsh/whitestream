jQuery(function () {
  $('body').on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
  });
  $('body').on('shown.bs.modal', '.modal', function () {
    $("#continue").on('click', function () {
      $("#download").trigger("click", "continueSubmission");
    });
  });
});