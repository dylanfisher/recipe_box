App.pageLoad.push(function() {
  var $nav = $('.nav--primary');
  var nav = $nav.get(0);
  var options = {
    offset : $nav.outerHeight(),
  };

  if($('.controller--home').length) {
    var $affixHolder = $('.nav--primary__affix-holder');

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
    headroom  = new Headroom(nav, options);
    headroom.init();
  }

});
