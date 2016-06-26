App.pageLoad.push(function() {

  $('.recently-uploaded-recipes').each(function() {
    var $wrapper = $(this);
    var $el = $wrapper.find('.marquee');
    App.marquee($el, $wrapper);
  });

});
