// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require best_in_place
//= require bootsy
//= require bootstrap
//= require jquery.autogrow-textarea
//= require owl.carousel
//= require jquery.validate
//= require jquery.validate.additional-methods

//= require_tree .

$(document).on('submit', '#login_form, #registration_form', function () {
}).on('ajax:success', '#login_form, #registration_form, #password_form', function () {
  $('.modal').modal('hide');
}).on('ajax:error', '#login_form, #registration_form', function (response, errors) {
  if (errors.responseText) {
    if ($(".errors").length < 1) {
      $("#login_form").prepend("<span class='errors'>" + errors.responseText + "</span>");
    }
  } else {
    for (var key in errors.responseJSON) {
       if(errors.responseJSON.hasOwnProperty(key)){
        $("#user_" + key).parent().append("<span class='error'>" + key + " is required</span>");
      }
    }
  }
});

jQuery(function () {
  $('body').on('shown.bs.modal', '.modal', function () {
    $("#registration_form").validate({
      rules: {
        "user[username]": "required",
        "user[email]": {
          required: true,
          email: true
        },
        "user[password]": {
          required: true
        }
      },
      messages: {
        "user[username]": {
          required: "Please enter a username",
          minlength: "Your username must consist of at least 2 characters"
        },
        "user[password]": {
          required: "Please provide a password",
          minlength: "Your password must be at least 5 characters long"
        },
        "user[email]": "Please enter a valid email address",
      }
    });
    $("#login_form").validate({
      rules: {
        "user[email]": "required",
        "user[password]": "required"
      },
      messages: {
        "user[email]": "Please enter your email address",
        "user[password]": "Please enter your password",
      }
    });
    $("#password_form").validate({
      rules: {
        "user[email]": "required"
      },
    });
  });
});