$( document ).ready(function() {
    $('.complete').click(function(){
      new CheckBox($(this)).call()
    })
});


class CheckBox {
    constructor(data) {
      this.currentCheckBox = data
    }

    call(){
      this.request();
      this.fleshMessage();
    }

  request() {
    $.ajax({
      type: 'PATCH',
      url: '/fillings' + '?' + 'filling_id=' + this.currentCheckBox.data('fillingId'),
      data: JSON.stringify({
        authenticity_token: this.currentCheckBox.data('authenticityToken'),
        order_item_id: this.currentCheckBox.data('orderItemId')
      }),
      contentType: 'application/json',
    });
  };

  fleshMessage() {
    $('.container.flash_message').append( $('<div class= \'alert alert-success text-center\'>Pizza updated</div>'));
    setTimeout(() => {
      $('.container.flash_message').text('');
    }, 2000);
  };
}
