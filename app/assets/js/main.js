$(document).on('turbolinks:load', function(){
	/*_____ Toggle _____*/
	$(document).on("click", ".toggle", function () {
		$(".toggle").toggleClass("active");
		// $("html").toggleClass("flow");
		$("body").toggleClass("move");
	});
	$(document).on("click", ".toggle.active", function () {
		$(".toggle").removeClass("active");
		// $("html").removeClass("flow");
		$("body").removeClass("move");
	});

	/*_____ Upload Blk _____*/
	$(document).on("click", ".upload_blk > button", function () {
		$(this).parent().children("input[type='file']").trigger("click");
	});
	$(document).on("change", "input[type='file']", function () {
		let file = $(this).val();
		if (this.files.length > 0) {
			$(this).parent(".upload_blk").children("button").text(file);
		} else {
			$(this)
				.parent(".upload_blk")
				.children("button")
				.text("Choose File");
		}
	});

	/*_____ Popup _____*/
	$(document).on("click", ".popup", function (e) {
		if (
			$(e.target).closest(".popup ._inner, .popup .inside").length === 0
		) {
			$(".popup").fadeOut("3000");
			$("html").removeClass("flow");
			$("#vid_blk > iframe, #vid_blk > video").attr("src", "");
		}
	});
	$(document).on("click", ".popup .x_btn", function () {
		$(".popup").fadeOut();
		$("html").removeClass("flow");
		$("#vid_blk > iframe, #vid_blk > video").attr("src", "");
	});
	$(document).keydown(function (e) {
		if (e.keyCode == 27) $(".popup .x_btn").click();
	});
	$(document).on("click", ".pop_btn", function (e) {
		e.target;
		e.relatedTarget;
		var popUp = $(this).attr("data-popup");
		$("html").addClass("flow");
		$(".popup[data-popup= " + popUp + "]").fadeIn();
		// $("#slick-restock").slick("setPosition");
	});
	$(document).on("click", ".pop_btn[data-src]", function () {
		var src = $(this).attr("data-src");
		$("#vid_blk > iframe, #vid_blk > video").attr("src", src);
	});

	/*_____ Form Block _____*/
	$(document).on("click", ".form_blk.pass_blk > i", function () {
		if ($(this).hasClass("icon-eye")) {
			$(this).addClass("icon-eye-slash");
			$(this).removeClass("icon-eye");
			$(this).parent().find(".input").attr("type", "text");
		} else {
			$(this).addClass("icon-eye");
			$(this).removeClass("icon-eye-slash");
			$(this).parent().find(".input").attr("type", "password");
		}
	});

	/*_____ FAQ's _____*/
	$(document).on("click", ".faq_blk > h5", function () {
		$(this)
			.parents(".faq_lst")
			.find(".faq_blk")
			.not($(this).parent().toggleClass("active"))
			.removeClass("active");
		$(this)
			.parents(".faq_lst")
			.find(".faq_blk > .txt")
			.not($(this).parent().children(".txt").slideToggle())
			.slideUp();
	});
	// $(".faq_lst > .faq_blk:nth-child(1)").addClass("active");

	/*_____ Run Button _____*/
	$(document).on("click", ".run_btn", function (event) {
		if (this.hash !== "") {
			event.preventDefault();
			var hash = this.hash;
			// header = $("header").height();
			$("html, body").animate(
				{
					// scrollTop: $(hash).offset().top - header,
					scrollTop: $(hash).offset().top,
				},
				10
			);
		}
	});

	/*
	|----------------------------------------------------------------------
	|       OTHER JAVASCRIPT
	|----------------------------------------------------------------------
	*/

	$("#clickaddfile").click(function (){
		$("#submitaddfile").trigger('click');
	});

	$("#clickaddphoto").click(function (){
		$("#submitaddphoto").trigger('click');
	});

	$('.edit_car_model').on('click', function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/cars/edit_model?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.edit_popup_div').html(response)
			}
    })
	});

	$('.view_detail').on('click', function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/users/view_profile?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.profile_popup_div').html(response)
			}
    })
	});
	

	$('.approve').on('click', function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/users/approve_user?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.approve_user_success_div').html(response)
					setTimeout(function(){
						location.reload()
					}, 2000);
			}
    })
	});

	$('.disapprove').on('click', function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/users/disapprove_user_popup?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.disapprove_user_popup_div').html(response)
					setTimeout(function(){
						location.reload()
					}, 2000);
			}
    })
	});

	$(".notification_btn").mouseover(function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
			url: `/admins/users/show_notification?id=${attribute_id}`,
			type: 'get',
			data: this.data,
			success: function(response) {
				$("#notification_counter").html(response.notifications_count)
			}
		})
	});

	$(".dropdown-menu.notfi_dropdown").mouseleave(function(){
		location.reload()		
	});

	$(document).on('click', ".disable_user", function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/users/disable_user_popup?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.disable_user_popup_div').html(response)
			}
    })
	});

	$(document).on('click', ".enable_user", function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/users/enable_user?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.enable_popup_div').html(response)
				setTimeout(function(){
					location.reload()
				}, 2000);
			}
    })
	});

	$(document).on('click', ".confirm_yes", function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/users/confirm_yes_popup?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.disable_user_popup_div').empty();
				$('.confirm_yes_popup_div').html(response)
				setTimeout(function(){
					location.reload()
				}, 2000);
			}
    })
	});

	$(document).on('click', ".confirm_disapprove", function(){
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/users/confirm_disapprove_popup?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.confirm_disapprove_popup_div').html(response)
			}
    })
	});

	$(document).on('click', ".confirm_no", function(){
		location.reload();
	});

	$("#searchbtn").keyup(function (){
		var word = $(this).val();
		$("#searchform").trigger('submit');
	});

	$(document).on("change", ".file", function(e){
		var preview = $(".upload-preview img");
		var input = $(e.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
				image_base64 = e.target.result;
				preview.attr("src", image_base64);
		};
		reader.readAsDataURL(file);
		$("#car_model_image").removeAttr("style").hide();
		$(".prof_img .img").removeAttr("style").hide();
	});

	$("div.pagination a").addClass("d-none");
	$("div.pagination em.current").addClass("d-none");
	$("a.next_page").removeClass("d-none");
	$("a.previous_page").removeClass("d-none");

	$(document).ready(function(){
		$(".next_page").text("");
		$(".previous_page").text("");
		
		$(".next_page").prepend("<img src='/assets/right-arrow-icon.svg' class='pagi_image next'/>");
		$(".previous_page").prepend("<img src='/assets/left-arrow-icon.svg' class='pagi_image'/>");
	});

	$(document).on("click", ".reload_page", function(){
		location.reload();
	});

	$(document).on("click", "#history_item", function () {
		var attribute_id  = $(this).attr("data-id")
		$.ajax({
      url: `/admins/users/get_host_details?id=${attribute_id}`,
      type: 'get',
      data: this.data,
			success: function(response) {
				$('.host_details_div').html(response)
			}
    })
	});

	$(document).on("click", ".cancel_send_money", function () {
		$('#confirm_transfer_money_popup_div').empty();
  	$('#send_money_popup_div_id').empty();
	});

	$(document).on('click', ".applyBtn", function(){
  	$("#export_form").submit();
		$("#calender").removeClass("new_overlay");
	});

	$(document).on("keyup keypress", function(e){
		if ($('#input_field_text').val() == '' && $('#submitaddphoto').val() == ''){
			var keyCode = e.keyCode || e.which;
			if (keyCode === 13) {
				e.preventDefault();
				return false;
			}
    }
	})

	$(".send_btn").on("click", function(e){
		if ($('#input_field_text').val() == '' && $('#submitaddphoto').val() == '' && $('#submitaddfile').val() == ''){
				e.preventDefault();
				return false;
			}
	})

	$(document).on("click", "#notify_modal .overlay, #notify_modal .x_btn", function(){
    history.go(0)
	})

});
