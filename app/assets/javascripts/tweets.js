$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();

  $(document).on('click', '.unfavorite-tweet', function(){
    t = $(this);
    var data = t.data();
    $.ajax({
      url: "/favorites" + data.tweet,
      type: 'POST',
      method: 'DELETE',
    })
    .success( function(){
      $(t).closest('blockquote').remove();
    })
    .fail( function(){
      alert("fail");
    });
  });

});
