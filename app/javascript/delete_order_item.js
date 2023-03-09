$( document ).ready(function() {
  $('.delete-order-item').click(function() {
    new RemoveOrder($(this)).remove();
  });
});


class RemoveOrder {
  constructor(data) {
    this.params = data;
    this.removeButton = $(`.delete-order-item.${this.params.data('id')}`);
    this.item = $(`tr.${this.params.data('id')}`);
    this.subtotal = $(`.subtotal.${this.params.data('id')}`);
    this.totalPrice = $('#total_price');
  }

  remove() {
    this.request();
    this.item.remove();
    this.newTotal();
  }

  newTotal() {
    const values = $('.quantity').map(function(index, item) {
      return $(item).data('total');
    });

    let sum = 0;
    values.each(function(index, value) {
      sum += value;
    });

    this.totalPrice.text(this.subtotal.data('currency') + (sum / 100).toFixed(2));
  }

  request() {
    $.ajax({
      type: 'DELETE',
      url: '/order_items' + '?' + 'id=' + this.params.data('id'),
      data: JSON.stringify({
        authenticity_token: this.params.data('authenticityToken'),
      }),
      contentType: 'application/json',
    });
  };
}
