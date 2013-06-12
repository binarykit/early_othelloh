$(function() {
  if ($('.prev.board').length > 0) {
    $('.current.board').hide();
    $('.black.score_board').removeClass('turn');
    $('.white.score_board').addClass('turn');
    $('.score_board .count').hide();
    setTimeout(function(){
      $('.prev.board').hide();
      $('.current.board').show();
      $('.white.score_board').removeClass('turn');
      $('.score_board .count').show();
      if ($('.winner').length <= 0) $('.black.score_board').addClass('turn');
    }, 3000);
  }
});