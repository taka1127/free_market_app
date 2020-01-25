$(".tabs").on("click",function(){
  console.log("hello");
	var $th = $(this).index();
	$(".info").removeClass("active");
	$(".nomessage").removeClass("active");
	$(this).addClass("active");
	$(".nomessage").eq($th).addClass("active");
});