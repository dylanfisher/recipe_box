App.pageLoad.push(function() {

  App.$infiniteLoadDisabler = $('[data-disable-infinite-scroll]');
  App.infiniteLoadInProgress = false;
  App.$infiniteLoader = $('#infinite-loader');

  if ( App.$infiniteLoader.length ) {

    $(window).on('scroll.infiniteScrollEvents', function() {
      if(App.$infiniteLoadDisabler.length || !App.$infiniteLoader.length) {
        $(window).off('scroll.infiniteScrollEvents');
        return;
      }

      if ( !App.infiniteLoadInProgress && App.$infiniteLoader.offset().top - App.scrollTop < App.windowHeight * 2 ) {
        App.$infiniteLoader.trigger('click');
        App.infiniteLoadInProgress = true;
      }
    });
  } else {
    $(window).off('scroll.infiniteScrollEvents');
    App.infiniteLoadInProgress = false;
  }

});
