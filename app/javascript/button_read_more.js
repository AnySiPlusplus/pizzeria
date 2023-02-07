$( document ).ready(function() {
  $('#read_more').click(function(event) {
    event.preventDefault();
    $('#short_description').addClass('hidden');
    $('#full_description').removeClass('hidden');
  });
});
