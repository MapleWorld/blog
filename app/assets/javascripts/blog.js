jQuery.ajaxSetup({ 
	'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});
$(document).ready(function() {
	$("#new_comment").submit(function() {
		$.post(this.action, $(this).serialize(), null, "script");
		
		return false;
	});
	return this;
});

