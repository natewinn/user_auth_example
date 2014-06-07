$(function(){

  // Show New Modal //
  $('.reveal-new').on('click', function () {
  
    $('#bottom-new').show( 'slow' );
  
    $('#top').show( 'slow' );
  });

  // Hide New Modal //
  $('.hide-new').on('click', function () {
  
    $('#bottom-new').hide( 'slow' );
  
    $('#top').hide( 'slow' );
  });

});