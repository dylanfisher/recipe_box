App.pageLoad.push(function() {
  var $nav = $('.nav--primary');
  var nav = $nav.get(0);
  var options = {
    offset : $nav.outerHeight(),
    tolerance : {
      up : 10,
      down : 0
    },
  };

  headroom  = new Headroom(nav, options);
  headroom.init();
});
