$( document ).ready(function() {
  $('#ordinary-button').click(function() {
    new ChangeFillingPage().changeToOrdinary();
  });

  $('#adding-button').click(function() {
    new ChangeFillingPage().changeToAdding();
  });
});

class ChangeFillingPage {
  constructor() {
    this.ordinary = $('#ordinary');
    this.ordinaryButton = $('#ordinary-button');
    this.adding = $('#adding');
    this.addingButton = $('#adding-button');
  }

  changeToAdding() {
    if (this.adding.hasClass('hidden')) {
      this.adding.removeClass('hidden');
      this.ordinaryButton.removeClass('active');
      this.addingButton.addClass('active');
      this.ordinary.addClass('hidden');
    }
  }

  changeToOrdinary() {
    if (this.ordinary.hasClass('hidden')) {
      this.ordinary.removeClass('hidden');
      this.addingButton.removeClass('active');
      this.ordinaryButton.addClass('active');
      this.adding.addClass('hidden');
    }
  }
}
