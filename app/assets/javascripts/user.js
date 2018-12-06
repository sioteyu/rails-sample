// $(document).ready(function () {
// 	$(document).on('turbolinks:load', function () {
// 		$('#new_post').on('ajax:success', function (data) {
// 			if (document.URL.split('=')[1] == 1 || document.URL.split('=')[1] == undefined) {
// 				$(data.detail[0].post).hide().prependTo('#posts').slideDown(500);
// 				$('#new_post')[0].reset();
// 			}
// 		})
//
// 		$('#new_post').on('ajax:error', function (err) {
// 			$('.errors').append('<div class="alert alert-danger">Empty post try again</div>');
// 			setTimeout(function () {
// 				$('.alert').fadeOut();
// 			}, 2000)
// 		})
//
// 		$('.btn-outline-danger').on('ajax:success', function (data) {
// 			$('#user-'+data.detail[0]).fadeOut(500);
// 		})
//
// 		$('#add_friend').on('ajax:success', function (data) {
// 			$('#add_friend').html('Awaiting acceptance')
// 		})
// 	})
//
// })
