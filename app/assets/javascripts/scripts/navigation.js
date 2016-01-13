App.pageLoad.push(function() {

  if($('.controller--home').length) {
    var $nav                 = $('.nav--primary');
    var $affixHolder         = $('.nav--primary__affix-holder');
      
    $(window).on('scroll.homeNavScrollEvents', function() {
      var st                   = $(this).scrollTop();
      var navOffsetTop         = $nav.offset().top;
      var affixHolderOffsetTop = $affixHolder.offset().top;

      if(st > navOffsetTop) {
        $nav.addClass('nav--primary--fixed');
        $('.nav--primary__affix-holder').show();
      } else if(st <= affixHolderOffsetTop) {
        $nav.removeClass('nav--primary--fixed');
        $('.nav--primary__affix-holder').hide();
      }
    });
  } else {
    $(window).off('scroll.homeNavScrollEvents');
  }

});
