$( document ).ready(function() {
  $('#minus').click(function(event) {
    event.preventDefault();
    new Calculator().minus();
  });

  $('#plus').click(function(event) {
    event.preventDefault();
    new Calculator().plus();
  });

  $('#quantity').focusout(function(even) {
    new Calculator().enter();
  });
});

class Calculator {
  constructor() {
    this.quantity = $('#quantity');
    this.price = $('#price');
    this.currentQuantity = parseInt(this.quantity.val());
    this.message = $('#message');
  }

  raiseError() {
    this.message.removeClass('hidden');
    setTimeout(this.hiddenClass, 1000, this.message);
  }

  hiddenClass(message) {
    message.addClass('hidden');
  }

  wrongNumber() {
    this.currentQuantity = 1;
    this.quantity.val(this.currentQuantity);
    this.raiseError();
  }

  afterOperation(newQuantity) {
    const newPrice = parseInt(this.price.data('price')) * newQuantity / 100;
    const text = this.price.data('currency') + newPrice.toFixed(2);
    this.price.text(text);
  }

  calculateOperation(operator) {
    let newQuantity;
    switch (operator) {
      case 'plus':
        newQuantity = this.currentQuantity + 1;
        break;
      case 'minus':
        newQuantity = this.currentQuantity - 1;
        break;
    }
    this.quantity.val(newQuantity);
    this.afterOperation(newQuantity);
  }

  plus() {
    if (this.currentQuantity < this.quantity.data('quantity') && this.currentQuantity > 0 ) {
      this.calculateOperation('plus');
    } else {
      this.raiseError();
    }
  }

  minus() {
    if (this.currentQuantity > 1) {
      this.calculateOperation('minus');
    } else {
      this.wrongNumber();
    }
  }

  enter() {
    if (this.currentQuantity > this.quantity.data('quantity')) {
      this.currentQuantity = parseInt(this.quantity.data('quantity'));
      this.quantity.val(this.currentQuantity);
    }

    if (isNaN(this.currentQuantity)) {
      this.wrongNumber();
    }

    if (this.currentQuantity < 1) {
      this.wrongNumber();
    }
    this.afterOperation(this.currentQuantity);
  }
}
