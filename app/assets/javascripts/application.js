// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require cocoon

$(document).on('turbolinks:load', function(){

  $('.sort-column').on('click', function(){
    var $t = $(this);
    var $data = $t.data();
    var $direction = $data.sortDirection;
    var $url = window.location.pathname;
    $.ajax({
      url: $url,
      method: 'GET',
      data: $data
    })
    .success(renderTable($t, $direction));
  });

  var renderTable = function($button, $direction){
    $('.sort-column').removeClass('bold-font-weight');
    $button.addClass('bold-font-weight');
    if ($direction === 'desc'){
      $button.data('sort-direction', 'asc');
    } else {
      $button.data('sort-direction', 'desc');
    }
  };

});
