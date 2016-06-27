App.pageLoad.push(function() {
  var headerOffset = $('#nav--primary').outerHeight();
  var selectors = '.mmmbox-images img';

  if ( !$(selectors).length ) return;

  App.scrollReveal = ScrollReveal().reveal( selectors, {
    scale: 1,
    distance: '40px',
    duration: 600,
    easing: 'ease-in-out',
    viewFactor: 0.2,
    viewOffset: { top: headerOffset, right: 0, bottom: 0, left: 0 },
  });
});
