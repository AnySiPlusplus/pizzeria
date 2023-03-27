$( document ).ready(function() {
  $('.quantity').keypress(function(even) {
    if (even.key === 'Enter') {
      new Counter($(this)).enter();
    }
  });

  $('.minus-pizza-quantity').click(function() {
    new Counter($(this)).minus();
  });

  $('.plus-pizza-quantity').click(function() {
    new Counter($(this)).plus();
  });
});

class Counter {
  constructor(data) {
    this.params = data;
    this.fild = $(`.quantity.${this.params.data('id')}`);
    this.price = $(`.subtotal.${this.params.data('id')}`);
  }

  plus() {
    this.validQuantity(parseInt(this.fild.val()) + 1);
  }

  minus() {
    this.validQuantity(parseInt(this.fild.val()) - 1);
  }

  enter() {
    this.validQuantity(parseInt(this.fild.val()));
  }

  validQuantity(quantity) {
    if (quantity >= 1) {
      this.request(quantity);
      this.fild.val(quantity);
      this.newPrice(quantity);
      this.newTotal();
      this.fleshMessage();
    }
  }

  request(quantity) {
    $.ajax({
      type: 'PATCH',
      url: '/order_items' + '?' + 'id=' + this.params.data('id'),
      data: JSON.stringify({
        authenticity_token: this.params.data('authenticityToken'),
        order_item: {
          quantity: quantity,
          pizza_id: this.params.data('pizzaId'),
        },
      }),
      contentType: 'application/json',
    });
  };

  newPrice(quantity) {
    const newPrice = parseInt(this.price.data('price')) * quantity / 100;
    const text = this.price.data('currency') + newPrice.toFixed(2);
    this.price.val(newPrice);
    this.fild.data('total', parseInt(this.price.data('price')) * quantity);
    this.price.text(text);
  };

  newTotal() {
    const values = $('.quantity').map(function(index, item) {
      return $(item).data('total');
    });

    let sum = 0;
    values.each(function(index, value) {
      sum += value;
    });

    $('#total_price').text(this.price.data('currency') + (sum / 100).toFixed(2));
  }

  fleshMessage() {
    $('.container.flash_message').append( $('<div class= \'alert alert-success text-center\'>Pizza updated</div>'));
    setTimeout(() => {
      $('.container.flash_message').text('');
    }, 2000);
  };
}
