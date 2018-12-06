$(document).ready(function () {
	$(document).on('turbolinks:load', function () {
		$('#new_post').on('ajax:success', function (data) {
			if (document.URL.split('=')[1] == 1 || document.URL.split('=')[1] == undefined) {
				$('#posts').prepend(data.detail[0].post);
				$('#new_post')[0].reset();
			}
		})

		$('#new_post').on('ajax:error', function (err) {
			$('.errors').append('<div class="alert alert-danger">Empty post try again</div>');
			setTimeout(function () {
				$('.alert').fadeOut();
			}, 2000)
		})

		$('.btn-outline-danger').on('ajax:success', function (data) {
			$('#user-'+data.detail[0]).fadeOut(500);
			console.log('user-'+data.detail[0]);
		})
	})

})
