jQuery(document).ready( function($) {

	// Calculate iframe height
	var height = $(window).height();
	$('.sfg-members').prop('style','height: ' + height + ';');

	// Remove Top Bar and Bottom Tab Switch on iframe
	$('iframe.sfg-members #top-bar').remove();
	$('iframe.sfg-members tr:last-of-type()').remove();

	// Check Script Loaded
	console.log('Custom.js Loaded');
});