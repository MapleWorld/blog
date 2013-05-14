$('#new_comment').bind('ajax:complete', function(evt, xhr, status){
  eval(xhr.responseText);
});