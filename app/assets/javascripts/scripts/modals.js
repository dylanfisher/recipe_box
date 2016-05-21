App.pageLoad.push(function() {

  if(!$('[data-dialog]').length) return;

  var $dlgtrigger = $('[data-dialog]'),
      somedialog = document.getElementById( $dlgtrigger.attr('data-dialog') ),
      dlg = new DialogFx( somedialog );

  $dlgtrigger.get(0).addEventListener( 'click', dlg.toggle.bind(dlg) );

});
