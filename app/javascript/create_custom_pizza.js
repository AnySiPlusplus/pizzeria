$( document ).ready(function() {
  $('.custom_pizza').click(function() {
    new CreateCustomPizza().call();
  });
});


class CreateCustomPizza {
  constructor() {
    this.totalPrice = $('#sub-total');
  }
  call() {
    this.installFillingsValue();
    this.changeTotalPrice();
  }


  fillings() {
    const fillings = [];
    $('.custom_pizza').each(function(index, item) {
      if ($(item).is(':checked')) {
        fillings.push($(item).data('fillingId'));
      };
    });
    return fillings;
  }

  changeTotalPrice() {
    const currentPrice = parseInt(this.totalPrice.data('price')) / 100;
    const newPrice = currentPrice + this.fillingsPrice();
    const text = this.totalPrice.data('currency') + newPrice.toFixed(2);
    this.totalPrice.text(text);
  }

  fillingsPrice() {
    const price = [];
    $('.custom_pizza').each(function(index, item) {
      if ($(item).is(':checked')) {
        price.push(($(item).data('price')));
      };
    });
    return price.reduce((a, b) => a + b, 0) / 100;
  }

  installFillingsValue() {
    $('#filling_ids').val(this.fillings);
  }
}
