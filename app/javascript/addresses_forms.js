$( document ).ready(function() {
  const billingAddress = $('#billing_form :input' );
  const shippingAddress = $('#shipping_form :input' );
  let values = [];

  billingAddress.keyup(function() {
    const billingButton = $('#button_billing');
    billingAddress.each(function(index, value) {
      values.push($(value).val());
    });
    billingButton.prop('disabled', values.includes(''));
    clearValues();
  });

  shippingAddress.keyup(function() {
    const shippingButton = $('#button_shipping');
    shippingAddress.each(function(index, value) {
      values.push($(value).val());
    });
    shippingButton.prop('disabled', values.includes(''));
    clearValues();
  });

  function clearValues() {
    values = [];
  }
});
