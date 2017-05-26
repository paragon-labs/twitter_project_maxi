$(document).on('turbolinks:load',function() {
  $('[data-toggle="tooltip"]').tooltip();
  $('.popoverData').popover({ trigger: 'hover', html: true });
});
