// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	$("#show_lookup_form").click(function() {
    $('input[name=postal_code]').focus();
  });
	('.weather-day-details').popover();
	$("#only-container").change(function() {
		if($('#only-container').is(':checked'))
		{
		  $(".plant:not(.true)").hide('slow');
		}
		else {
			$(".plant:not(.true)").show('slow');
		}
	});
});