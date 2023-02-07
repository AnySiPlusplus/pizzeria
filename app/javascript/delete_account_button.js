$( document ).ready(function() {
  $('#accept').click(function() {
    const checkBox = $('#accept');
    const deleteButton = $('#btn_delete');
    deleteButton.prop('disabled', !checkBox.prop('checked') );
  });
});
