

$(document).on('turbolinks:load', function() {
	$('.mypage-tab').on('click', function(){
		$('.is-active').removeClass('is-active');
		$(this).toggleClass('is-active');
		$('.is-show').removeClass('is-show');
    const index = $(this).index();
    $('.mypage-panel').eq(index).toggleClass('is-show');
    console.log($('.mypage-panel'))
    return false;    
	});
});

// $(document).on('turbolinks:load', function() {
// 	$('.mypage-tab2').on('click', function(){
// 		$('.is-active2').removeClass('is-active2');
// 		$(this).toggleClass('is-active2');
// 		$('.is-show2').removeClass('is-show2');
// 		const index = $(this).index();
//     $('.mypage-panel2').eq(index).toggleClass('is-show2');
//     return false;    
// 	});
// });

