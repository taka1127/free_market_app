$(document).on('turbolinks:load', ()=> {
  $('img.mini-photo').hover(function() {
    var ImgSrc = $(this).attr("src");
    $("img#main-photo").attr({src:ImgSrc});
      return false;
  });
});