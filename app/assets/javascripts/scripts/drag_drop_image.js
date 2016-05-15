App.pageLoad.push(function() {

  if(!$('[data-droppable]').length) return;

  var dropzone = $('[data-droppable]').get(0);

  var singleImageOptions = {
    autoProcessQueue: false,
    url: $('#user__dropzone').closest('[data-droppable-url]'),
    // createImageThumbnails: false,
    maxFilesize: 4,
    acceptedFiles: 'image/*',
    init: function() {
      console.log('init');
      this.on('success', function(file, response) {
        console.log(file, response);
        var imageSrc = response;
        $('.img-responsive').attr('src', imageSrc);
        if(imageSrc == '/assets/images/offerfeatimg.jpg') {
          $('.removebutton').hide();
        } else {
          $('.removebutton').show();
        }
        this.removeFile(file); // This line removes the preview
      })
    }
  }

  new Dropzone(dropzone, singleImageOptions);

});
