$( document ).ready(function() {
  const filds = $('#new_user :input');
  let values = [];

  filds.keyup(function() {
    const loInButton = $('.btn.btn.btn-default.mb-20.log_in');
    filds.each(function(index, value) {
      values.push($(value).val());
    });
    loInButton.prop('disabled', values.includes(''));
    values = [];
  });
});
