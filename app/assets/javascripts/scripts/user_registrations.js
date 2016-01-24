App.pageLoad.push(function() {

  $('.controller--devise-registrations__next-step-button').offOn('click.deviseUserRegistrationEvents', function() {
    $('.controller--devise-registrations__wrapper').addClass('showing-step-2');
  });

});
