App.marquee = function($el, $wrapper) {

  var animationInterval;

  $el.css({position: 'relative'});

  (function animate(looped) {
    var wrapperWidth = $wrapper.outerWidth(true);
    var startingPosition = 0;

    if(looped) {
      startingPosition = wrapperWidth;
    } else {
      animationInterval = setInterval(function() {
        if(hasScrolledPast($el)) {
          $el.velocity('stop');
          animate(true);
          return;
        } else {
        }
      }, 500);
    }

    $el.css({left: startingPosition});

    $el.velocity({left: '-=16000'}, 30 * 1000 * 10, 'linear', function() {
      animate(true);
    });
  })();

  function hasScrolledPast(el) {
    if (typeof jQuery === "function" && el instanceof jQuery) {
      el = el[0];
    }

    var rect = el.getBoundingClientRect();
    return (
      rect.right <= 0
    );
  }

};
