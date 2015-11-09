$(document).ready(function(){

	//Navigation Events
	$(".menuhover").hoverIntent(function() { 						
		$(this).find("ul.subnav").slideDown('fast').show();
		$(this).find("span").addClass("subhover");
	}, function(){	
		$(this).find("ul.subnav").slideUp('slow');
		$(this).find("span").removeClass("subhover");
	});

});