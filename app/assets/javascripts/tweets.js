$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();

  $(document).on('click', '.unfavorite-tweet', function(){
    var $t = $(this);
    var $data = $t.data();
    $.ajax({
      url: "/favorites" + $data.tweet,
      type: 'POST',
      method: 'DELETE',
    })
    .success(function(response){
      changeButtonToFavorite($t, response['tweet_params'], $data.action);
    })
    .fail( function(){
      alert("fail");
    });
  });

  $(document).on('click', '.favorite-tweet', function(){
    $t = $(this);
    var $data = $t.data();
    $.ajax({
      url: '/favorites',
      type: 'POST',
      data: $data,
      dataType: 'json',
    })
    .success(function(response){
      changeButtonToUnfavorite($t, response['tweet_id']);
    })
    .fail(function(){
      alert('fail');
    });
  });

  var changeButtonToUnfavorite = function(button, tweet_id){
    $(button).removeClass('favorite-tweet').addClass('unfavorite-tweet');
    $(button).find('span').removeClass('glyphicon-star-empty')
             .addClass('glyphicon-star');
    $(button).data('tweet', '/' + tweet_id).data('action', 'latest_tweets');
  }

  var changeButtonToFavorite = function(button, tweet_params, action){
    if (action == 'latest_tweets'){
      $(button).removeClass('unfavorite-tweet').addClass('favorite-tweet');
      $(button).find('span').removeClass('glyphicon-star')
               .addClass('glyphicon-star-empty');
      $(button).data('tweet', tweet_params);
    }
    else {
      $(button).closest('blockquote').remove();
    }

  }

});
