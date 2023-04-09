$( document ).ready(function() {
    $('#create_pizza_button').click(function() {
        new CreateCustomPizza().call();
    });

});


class CreateCustomPizza {
    constructor(data) {
        this.createPizzaButton = $('#create_pizza_button');
    }

    call() {
        this.request();
    }

    request() {
        $.ajax({
            type: 'POST',
            url: '/fillings',
            data: JSON.stringify({
                authenticity_token: this.createPizzaButton.data('authenticityToken'),
                fillings_id: this.fillings(),
                dimension_id: $('#dimension').val(),
            }),
            contentType: 'application/json',
            success: this.fleshMessage(),
        });
    };

    fillings() {
      let fillings = [];
      $('.custom_pizza').each(function(index, item) {
          if($(item).is(':checked')){
            fillings.push($(item).data('fillingId'))
          };
        });
      return fillings
    }

    fleshMessage() {
        const fleshContainer = $('.container.flash_message');
        if (fleshContainer.text() == '\n') {
            fleshContainer.append($('<div class= \'alert alert-success text-center\'>Pizza created</div>'));
            setTimeout(() => {
                $('.container.flash_message').text('\n');
            }, 2000);
        }
    };
}
