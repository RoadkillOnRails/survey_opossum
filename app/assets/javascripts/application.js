// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery_nested_form

$(function() {

  //if not logged in
  if (window.location.pathname.match(/^\/questionnaire\//)) {
    $("#downCaret").hide();
  };

  // inspiration for this example came from here: http://stackoverflow.com/questions/24310046/close-toggle-box-by-clicking-anywhere-else
  $("#downCaret").click(function() {
    event.stopPropagation();
  	$(".profile_dropdown").toggle();
  });
  $('*:not(#downCaret)').click(function(){
    $(".profile_dropdown").hide();
  });
});

//Show header on all but signup and login

$(function() {
  if (window.location.pathname == "/login"||window.location.pathname == "/signup"||window.location.pathname.match(/^\/signup./)){
            $('header').hide();
      } else {
            $('header').show();
      }
});
