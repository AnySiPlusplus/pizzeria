$( document ).ready(function() {
  $('#view_more').click(function() {
    const urlParams = new URLSearchParams(window.location.search);
    urlParams.append('page', $('#view_more').data('page'));
    $.ajax({
      type: 'GET',
      url: '/books' + '?' + urlParams.toString(),
      dataType: 'json',
      success: function(data) {
        const nextPage = $('#view_more').data('page')+ 1;
        $('#view_more').data('page', nextPage);
        $('#books_list').append(data.html);
        if ($('#view_more').data('page') > $('#view_more').data('pages')) {
          $('#view_more').remove();
        };
      },
    });
  });
});
