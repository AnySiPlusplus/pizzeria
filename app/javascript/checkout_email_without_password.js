$( document ).ready(function() {
  const emailField = $('#users_privacy_email_email');
  const emailButton = $('#continue_checkout');

  emailField.keyup(function() {
    emailButton.prop('disabled', !emailField.val());
  });
});
