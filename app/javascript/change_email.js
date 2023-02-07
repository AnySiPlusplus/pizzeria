$( document ).ready(function() {
  const emailField = $('#user_email');
  const emailButton = $('#change_email');

  emailField.keyup(function() {
    emailButton.prop('disabled', !emailField.val());
  });
});
