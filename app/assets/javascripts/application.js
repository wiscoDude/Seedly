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
	$('.show-plant-details').click(function() {
		$(".plant-details .plant").hide();
		var div = '#' + $(this).data('target');
		$(div).show();
		return false;
	});
	$('a#show-lookup-form').click(function() {
		$('#lookup').toggle('medium');
		$('[name=postal_code]').focus();
		return false;
	});
	$("#only-container").change(function() {
		if($('#only-container').is(':checked'))
		{
		  $(".plants-list .plant:not(.true)").hide('slow');
		}
		else {
			$(".plants-list .plant:not(.true)").show('slow');
		}
	});
});