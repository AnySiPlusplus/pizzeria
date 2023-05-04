$( document ).ready(function() {
  $('.complete').click(function() {
    new CheckBox($(this)).call();
  });

  $('#custom_pizza_dimension_edit').click(function() {
    new CheckBox($(this)).call();
  });
});


class CheckBox {
  constructor(data) {
    this.currentCheckBox = data;
    this.totalPrice = $('#total_price');
    this.dimensionSelector = $('#custom_pizza_dimension_edit');
  }

  call() {
    this.request();
    this.fleshMessage();
  }

  request() {
    $.ajax({
      type: 'PATCH',
      url: '/custom_pizza' + '?' + 'filling_id=' + this.filling_id(),
      data: JSON.stringify({
        authenticity_token: this.currentCheckBox.data('authenticityToken'),
        order_item_id: this.currentCheckBox.data('orderItemId'),
        pizza_dimension: this.dimensionSelector.val(),
      }),
      contentType: 'application/json',
      success: this.changeTotalPrice(),
    });
  };

  filling_id() {
    return this.currentCheckBox.data('fillingId') ? this.currentCheckBox.data('fillingId') : 0;
  }

  fillingsPrice() {
    const price = [];
    $('.complete').each(function(index, item) {
      if ($(item).is(':checked')) {
        price.push(($(item).data('price')));
      };
    });
    return price.reduce((a, b) => a + b, 0) / 100;
  }

  currentDimensionPrice() {
    const currentDimension = this.dimensionSelector.val();
    return this.dimensionSelector.data('dimensions-' + currentDimension) / 100;
  }

  changeTotalPrice() {
    const currentPrice = parseInt(this.totalPrice.data('price')) / 100;
    const newPrice = currentPrice + this.fillingsPrice() + this.currentDimensionPrice();
    const text = this.totalPrice.data('currency') + newPrice.toFixed(2);
    this.totalPrice.text(text);
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
