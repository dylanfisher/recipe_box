App.pageLoad.push(function() {

  if(typeof $('[data-carousel]').data().flickity != 'undefined') {
    $('[data-carousel]').flickity('destroy');
  }

  $('[data-carousel]').flickity({
    pageDots: false,
    wrapAround: true,
    // arrowShape: 'M 0,50 L 60,00 L 50,30 L 80,30 L 80,70 L 50,70 L 60,100 Z'
  });

});
