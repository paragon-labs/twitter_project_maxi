$(document).on('turbolinks:load', function(){

  $('.js-favorites-autocomplete').on('keyup',function(e){
    if (e.which === 13) {
      var $search = $(this).val();
      $.ajax({
        url: '/favorites',
        method: 'GET',
        data: { search: $search }
      });
    }
  });

  var initializeFavoritesTypeahead = function(){

    var favoritesTypeahead = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('user_name'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      remote: { url: '/favorites.json?search=%query', wildcard: '%query' }
    });

    favoritesTypeahead.initialize().done(function(){
      $('.js-favorites-autocomplete').typeahead(null, {
        displayKey: 'user_name',
        source: favoritesTypeahead.ttAdapter()
      });
    });
  };

  initializeFavoritesTypeahead();

})
