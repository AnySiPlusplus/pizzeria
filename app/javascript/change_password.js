$(document).ready(function() {
  const changePassword = $('#new_password_form_wrapper :input');
  let values = [];

  changePassword.keyup(function() {
    const changePasswordButton = $('#change_password');
    changePassword.each(function(index, value) {
      values.push($(value).val());
    });
    changePasswordButton.prop('disabled', values.includes(''));
    values = [];
  });
});
