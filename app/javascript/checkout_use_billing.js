$( document ).ready(function() {
  const checkBox = $('.checkbox-input');
  const shippingForm = $('#shipping_form');
  const buttonSave = $('.check_box_button.hidden');

  checkBox.click(function() {
    if (checkBox.prop('checked')) {
      shippingForm.addClass('hidden');
      buttonSave.removeClass('hidden');
    } else {
      shippingForm.removeClass('hidden');
      buttonSave.addClass('hidden');
    }
  });
});
