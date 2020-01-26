$(".info").on("click",function(){
  var $th = $(this).index();
  $("#panel_1").removeClass("active");
  $("#panel_2").removeClass("active");
  $(this).addClass("active");
  $(".nomessage").eq($th).addClass("active");
});


// $(document).on('turbolinks:load', ()=> {  
//   $(".info").on("click",function(){
//     var $th = $(this).index();
//     $("#panel_1").removeClass("active");
//     $("#panel_2").removeClass("active");
//     $(this).addClass("active");
//     $(".nomessage").eq($th).addClass("active");
//   });
// });