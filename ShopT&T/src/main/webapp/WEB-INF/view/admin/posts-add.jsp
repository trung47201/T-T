<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Add Posts</title>
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-admin-product2.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-admin-login.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-search3.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-message.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/re-admin3.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/re-dashboard4.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-nav2.css'/>">

<style>
.message input {
	width: 100px;
}

.id-new-product input {
	width: 100%;
	height: 40px;
	padding: 0px 10px 0 10px;
}

.table-add-new-product {
	margin-top: 0;
}

.id-new-product.title-add {
	width: 94%;
}

.id-new-product {
	margin-top: 10px;
}

.selected-add-new-product {
	height: 40px;
}

.phone-number textarea {
	padding: 5px 10px;
}

.btn-add-new-product input {
	cursor: pointer;
}

table.table-new-product td {
	width: 30%;
}

.video-display {
    height: 500px;
    width: 370px;
    text-align: center;
}

.phone-number textarea {
	max-height: 120px;
}

.id-new-product {
	margin-top: 13px;
	width: 94%;
}

.img-display {
	height: 445px;
	width: 370px;
}

.btn-add-new-product {
	justify-content: right;
}
</style>

<body>

	<div class="admin-body">
		<jsp:include page="../layouts/admin/a-nav.jsp"></jsp:include>
		<section class="admin-shoes-product">
			<jsp:include page="../layouts/admin/a-header.jsp"></jsp:include>

			<div class="nav-history">
				<div class="origin">
					<img
						src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
						alt=""> <a href="/ShopTandT/admin">Home</a>
				</div>

				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-used-product-100-title.png"/>"
						alt=""> <a href="">Layout</a>
				</div>
				<div>
					<p>/</p>
					<img style="width: 24px; height: 24px; margin-top: 0px;"
						src="<c:url value="/assets/images/icons/icons8-t-shirt-64-title.png"/>"
						alt=""> <a href="/ShopTandT/admin/layout/posts">Posts</a>
				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
						alt=""> <a href="/ShopTandT/admin/layout/posts/add">Add
						new posts</a>
				</div>
			</div>

			<div class="table-add-new-product">
				<form action="/ShopTandT/admin/layout/add-new-posts/savefile"
					method="post" enctype="multipart/form-data">
					<table class="table-new-product">
						<tr>
							<td colspan="1" style="vertical-align: top;">
								<div class="phone-number">
									<p>Content</p>
									<textarea maxlength="500" id="txt-description" name="content"></textarea>
								</div>
								<div class="id-new-product title-add">
									<p>URL</p>
									<input type="text" id="url" name="url">
								</div>
							</td>
							<td rowspan="2" style="vertical-align: top;">
								<div class="id-new-product">
									<p>Video</p>
									<input type="file" id="video" name="video">
								</div>
								<div class="video-display">
									<video height="100%" controls="controls"
										style="visibility: hidden;">
										<source src="" type="video/mp4">
									</video>
								</div>
							</td>
							<td>
								<div class="id-new-product">
									<p>Image</p>
									<input type="file" id="filetag" name="filetag">
								</div>
								<div class="img-display">
									<img src="" id="preview">
								</div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td colspan="1">
								<div class="btn-add-new-product">
									<input type="button" value="Add" id="btn-addnewproduct"
										name="btn-addnewproduct">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<jsp:include page="../layouts/admin/a-footer.jsp"></jsp:include>
		</section>

	</div>

	<div class="message msg-order message-notify none">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-notify"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" type="button" value="Cancel"> <input
				class="ok ok-notify hover-btn" type="button" value="OK">
		</div>
	</div>
	<div class="message msg-order message-done none">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-done"></p>
		<div class="btn-ok-cancel">
			<input class="ok ok-done hover-btn" type="button" value="OK">
		</div>
	</div>

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<script>
		$("#btn-addnewproduct").click(
				function() {
					var title = $("#title").val();
					var price = $("#price").val();
					var discount = $("#discount").val();
					var style = $('#select-style').find(":selected").val();
					var gender = $('#select-gender').find(":selected").val();
					var user = $('#select-user').find(":selected").val();
					var brand = $('#select-brand').find(":selected").val();
					var file = $('input[type=file]').val();
					var description = $("#txt-description").val();
					var error = "";

					if (title == "") {
						error += "Title is empty! \n";
					} else if (price == "") {
						error += "Price is empty! \n";
					} else if (discount == "") {
						error += "Discount is empty! \n";
					} else if (style == "") {
						error += "You haven't chosen a style yet!! \n";
					} else if (gender == "") {
						error += "You haven't chosen a gender yet!! \n";
					} else if (user == "") {
						error += "You haven't chosen a user yet!! \n";
					} else if (brand == "") {
						error += "You haven't chosen a brand yet!! \n";
					} else if (file == "") {
						error += "You haven't chosen a image yet!! \n";
					} else if (description == "") {
						error += "Description is empty! \n";
					}
					if (error == "") {
						$(this).attr('type', 'submit');
					} else {
						$(".message-done").removeClass("none");
						$(".content-msg-done").text(error);
						$(".content-msg-done").html(
								$(".content-msg-done").html().replace(/\n/g,
										'<br/>'));
						$('.ok-done').click(function() {
							$(".message-done").addClass("none");
						});
					}
				});
	</script>
	<script>
		$('.cancel').click(function() {
			$(".message").addClass("none");
			location.reload();
		});
	</script>
	<!-- choose image and display -->
	<script>
		var fileTag = document.getElementById("filetag"), preview = document
				.getElementById("preview");
		fileTag.addEventListener("change", function() {
			changeImage(this);
		});

		function changeImage(input) {
			var reader;
			if (input.files && input.files[0]) {
				reader = new FileReader();

				reader.onload = function(e) {
					preview.setAttribute('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<!-- choose image and display -->
	<script>
		document.getElementById("video").onchange = function(event) {
			let file = event.target.files[0];
			let blobURL = URL.createObjectURL(file);
			document.querySelector("video").style.visibility = 'visible';
			document.querySelector("video").src = blobURL;
		}
	</script>
</body>
</html>