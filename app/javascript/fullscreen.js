$(document).ready(function() {
  const heightR = $(window).height();

  if ($('.shop-quantity').data('orderItems') <= 2 ) {
    $('.cart-conteiner').css({'height': heightR});
  }

  if ( $('#reviews').data('reviews') === 0 ) {
    $('.pizza-fullscreen').css({'height': heightR});
  }
});
