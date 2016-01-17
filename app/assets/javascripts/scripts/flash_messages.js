App.pageLoad.push(function() {

  var $flash = $('.flash-messages');

  if(!$flash.length) return;

  App.startFlashTimer = function() {
    clearTimeout(App.flashTimeout);
    $flash.css({opacity: 1}).removeClass('flash-messages--hidden');
    App.flashTimeout = setTimeout(function() {
      fadeOutFlash();
    }, 5000);
  };

  App.startFlashTimer();

  $flash.offOn('click.flashMessageEvents', function() {
    fadeOutFlash();
  });

  function fadeOutFlash() {
    $flash.transition({opacity: 0}, function() {
      $flash.addClass('flash-messages--hidden');
      clearTimeout(App.flashTimeout);
    });
  }

});
