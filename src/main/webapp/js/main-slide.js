$(document).ready(function() {
	  var slideCount = $('.slide').length;
	  var slideWidth = $('.slide').width();
	  var slideContainerWidth = slideCount * slideWidth;

	  $('.slide-container').css('width', slideContainerWidth);

	  setInterval(function() {
	    var currentMarginLeft = parseInt($('.slide-container').css('margin-left'));
	    var newMarginLeft = currentMarginLeft - slideWidth;

	    $('.slide-container').animate({
	      'margin-left': newMarginLeft
	    }, 1000, function() {
	      $('.slide:first-child').appendTo('.slide-container');
	      $('.slide-container').css('margin-left', '0');
	    });
	  }, 5000);
	});