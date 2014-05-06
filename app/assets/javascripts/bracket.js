$(document).ready(function(){

	wrapperWidth = $('.wrapper').width();
	console.log(wrapperWidth);


	$(window).on('resize', function() {
		var wrapperWidth = $('.wrapper').width();
		console.log(wrapperWidth);
	});

})
