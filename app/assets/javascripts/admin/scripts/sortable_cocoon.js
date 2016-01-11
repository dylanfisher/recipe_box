App.pageLoad.push(function() {

  if(!$('[data-sortable="true"]').length) return;

  if(typeof $('[data-sortable="true"]').data().uiSortable != 'undefined') {
    $('[data-sortable="true"]').sortable('destroy');
  };

  $('[data-sortable="true"]').sortable({
    items: '> .nested-fields',
    update: function( event, ui ) {}
  });

  $('[data-sortable="true"]').on('sortupdate', function(event, ui) {
    var $wrapper = $(event.target);

    $wrapper.find('.nested-fields').each(function() {
      var index = $wrapper.find('.nested-fields').index(this);
      $(this).find('input[id*="_position"]').val(index);
    });
  });

});
