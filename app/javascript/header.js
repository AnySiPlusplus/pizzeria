$(document).scroll(function() {
  navbarScroll();
});

function navbarScroll() {
  const y = window.scrollY;
  const header = $('.header')
  const dropdown = $('#dropdown')
  if (y > 10) {
    header.addClass('small');
    dropdown.addClass('hidden')
  } else if (y < 10) {
    header.removeClass('small');
    dropdown.removeClass('hidden')
  }
}
