App.pageLoad.push(function() {

  var $flash = $('.flash-messages');

  if(!$flash.length) return;

  App.startFlashTimer = function(forceShow) {
    clearTimeout(App.flashTimeout);

    if(forceShow) {
      $flash.css({opacity: 1}).removeClass('flash-messages--hidden').addClass('flash-messages--visible');;

      App.flashTimeout = setTimeout(function() {
        fadeOutFlash();
      }, 5000);
    }
  };

  // App.startFlashTimer();

  $flash.offOn('click.flashMessageEvents', function() {
    fadeOutFlash();
  });

  function fadeOutFlash() {
    $flash.transition({opacity: 0}, function() {
      $flash.removeClass('flash-messages--visible').addClass('flash-messages--hidden');
      clearTimeout(App.flashTimeout);
    });
  }

});
