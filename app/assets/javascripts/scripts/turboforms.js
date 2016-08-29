// Routes forms with method GET through Turbolinks automatically

$(document).on('submit', 'form[method=get]', function(e) {
  e.preventDefault();

  var separator = this.action.indexOf('?') == -1 ? '?' : '&';
  var url = [this.action, $(this).serialize()].join(separator);

  Turbolinks.visit(url);
});
