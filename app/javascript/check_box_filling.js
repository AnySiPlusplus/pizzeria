$( document ).ready(function() {
  $('.complete').click(function() {
    new CheckBox($(this)).call();
  });

  $('#custom_pizza_dimension_edit').click(function(){
    // new CheckBox($(this)).call();
    console.log($('#custom_pizza_dimension_edit').val())
  })
});


class CheckBox {
  constructor(data) {
    this.currentCheckBox = data;
    this.totalPrice = $('#total_price');
    this.dimensionSelector = $('#custom_pizza_dimension_edit')
  }

  call() {
    this.request();
    this.fleshMessage();
  }

  request() {
    $.ajax({
      type: 'PATCH',
      url: '/custom_pizza' + '?' + 'filling_id=' + this.currentCheckBox.data('fillingId'),
      data: JSON.stringify({
        authenticity_token: this.currentCheckBox.data('authenticityToken'),
        order_item_id: this.currentCheckBox.data('orderItemId'),
      }),
      contentType: 'application/json',
      success: this.checkSubtotal(),
    });
  };

  checkSubtotal() {
    this.currentCheckBox.is(':checked') ? this.addAmount() : this.substructAmount();
  }

  addAmount() {
    const result = parseFloat(this.totalPrice.data('price')) + this.currentCheckBox.data('price') / 100;
    this.afterOperation(result);
  }

  substructAmount() {
    const result = parseFloat(this.totalPrice.data('price')) - this.currentCheckBox.data('price') / 100;
    this.afterOperation(result);
  }

  currentDimensionPrice() {
    const currentDimension = this.dimensionSelector.val()
    return this.dimensionSelector.data(currentDimension) / 100
  }

  afterOperation(result) {
    this.totalPrice.data('price', result.toFixed(2));
    this.totalPrice.text(this.totalPrice.data('currency') + result.toFixed(2));
  }

  fleshMessage() {
    const fleshContainer = $('.container.flash_message');
    if (fleshContainer.text() == '\n') {
      fleshContainer.append($('<div class= \'alert alert-success text-center\'>Pizza updated</div>'));
      setTimeout(() => {
        $('.container.flash_message').text('\n');
      }, 2000);
    }
  };
}
