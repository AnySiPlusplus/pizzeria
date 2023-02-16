$( document ).ready(function() {
  window.getStars = function(params) {
    const ratingField = $('#review_rating');
    const lastValue = ratingField.val();

    ratingField.prop('value', params);

    dissabledAmountStars(params, lastValue);
    enabledAmoundStars(params);
  };

  function enabledAmoundStars(params) {
    $('#my_rating i').each(function(index) {
      if (index + 1 <= params) {
        $('#star_' + index).removeClass('rate-empty');
        $('#star_' + params).removeClass('rate-empty');
      }
    });
  }

  function dissabledAmountStars(params, lastValue) {
    $('#my_rating i').each(function(index) {
      index + 1;
      $('#star_' + lastValue).addClass('rate-empty');
      $('#star_' + index).addClass('rate-empty');
    });
  }
});
