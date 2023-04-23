
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Add Handbags gallery</title>

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
<link rel="stylesheet" href="<c:url value='/assets/css/colorjoe.css'/>">
<style>
.message input {
	width: 100px;
}

.table-add-new-product {
	margin-top: 0;
	margin-left: 0;
	width: 100%;
}

.id-new-product {
	margin-top: 7px;
	width: 100%;
}

.selected-add-new-product {
	height: 40px;
}

.btn-add-new-product input {
	cursor: pointer;
}

.id-new-product-size {
	margin-top: 15px;
}

.list-size-add-new-product {
	margin-bottom: 15px;
	width: 93%;
}

.btn-add-new-product {
	margin-left: -30px;
	margin-top: 15px;
}

.list-size-add-new-product span {
	height: 40px;
	width: 40px;
	justify-content: unset;
	padding: 0 10px;
	margin-right: 18%;
}

.list-size-add-new-product input {
	width: 80px;
	margin-left: 30px;
	border: 2px solid #cb82a9;
}

table.table-new-product {
	width: 100%;
}

.img-display {
	max-width: 540px;
	height: 540px;
	overflow: hidden;
	justify-content: center;
	display: flex;
	margin-top: 15px;
}

.selected-add-new-product {
	width: 90%;
}

input.cancel {
	width: 124px;
}

.gallery {
	width: 515px;
	height: 510px;
	overflow-y: scroll;
	overflow-x: hidden;
	margin-top: 15px;
}

.gallery img {
	width: 100%;
}

.container {
	margin-left: 52px;
	margin-top: 0px;
	width: 527px;
}

.new-color-size-clothing td {
	width: 50%;
}

.form-add-color input {
	margin-top: 10px;
	padding: 5px 10px;
}

.form-add-color button {
	cursor: pointer;
	margin-top: 27px;
	padding: 5px 30px;
	background: #cb82a9;
	color: white;
}

.list-size-add-new-product div {
	margin-bottom: 10px;
	display: flex;
	width: 100%;
}

.list-size-add-new-product {
	width: 90%;
	display: block;
	height: 110px;
	overflow-y: scroll;
	border: 1px solid #cb82a9;
	border-right: 0;
	border-left: 0;
	padding-top: 4px;
	padding-left: 20px;
}
</style>

<body>
	<div class="admin-body">
		<jsp:include page="../../layouts/admin/a-nav.jsp"></jsp:include>
		<section class="admin-shoes-product">
			<jsp:include page="../../layouts/admin/a-header.jsp"></jsp:include>

			<div class="nav-history">
				<div class="origin">
					<img
						src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
						alt=""> <a href="/ShopTandT/admin">Home</a>
				</div>

				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-dirty-clothes-100.png"/>"
						alt="" style="opacity: 0.6;"> <a href="">Products</a>
				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-bag-100.png"/>"
						alt=""> <a href="/ShopTandT/admin/product/handbags">Handbags</a>
				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
						alt=""> <a href="">Add Handbags Gallery</a>
				</div>
			</div>

			<div class="table-add-new-product">
				<form action="/ShopTandT/admin/product/handbags-gallery/savefile"
					id="myform" method="post" enctype="multipart/form-data">
					<table class="table-new-product">
						<tr>
							<td>
								<div class="id-new-product">
									<p>Product</p>
									<select class="selected-add-new-product" id="select-product"
										name="product">
										<option value="" disabled="disabled" selected>Choose
											product</option>

										<c:forEach var="liProduct" items="${ listProduct }">
											<option value="${ liProduct.id }">${ liProduct.id }
												- ${ liProduct.title }</option>
										</c:forEach>
									</select>
								</div>
							</td>
							<td rowspan="6" class="td-img-display">
								<div class="gallery" id="gallery"></div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="id-new-product">
									<p>Image</p>
									<input type="file" multiple id="filetag" name="filetag">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="btn-add-new-product">
									<input type="button" value="Add" id="btn-addnewproduct"
										name="btn-addnewproduct">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<jsp:include page="../../layouts/admin/a-footer.jsp"></jsp:include>
		</section>
	</div>

	<div class="message msg-order message-notify none" id="gallery-add">
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
					var product = $('#select-product').find(":selected").val();
					var file = $('input[type=file]').val();
					var error = "";

					if (product == "") {
						error += "You haven't chosen a product yet!! \n";
					} else if (file == "") {
						error += "You haven't chosen a image yet!! \n";
					}

					if (error == "") {
						$("#myform").submit();
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


	<c:if test="${ sessionScope.addhandbags != null }">
		<script type="text/javascript">
			var check = "${ sessionScope.addhandbags }";
			if (check == "true") {
				$("#gallery-add").removeClass("none");
				$("#gallery-add .content-msg-notify").text(
						"Continue add gallery?");
				$("#gallery-add .ok-notify")
						.click(
								function() {
									var xhr = new XMLHttpRequest();
									xhr
											.open("GET",
													"/ShopTandT/admin/product/handbags/add-gallery?continue");
									xhr.onload = function() {
										window.location
												.assign("/ShopTandT/admin/product/handbags/add-gallery");
									};
									xhr.send();
								});
				$("#gallery-add .cancel")
						.click(
								function() {
									var xhr = new XMLHttpRequest();
									xhr
											.open("GET",
													"/ShopTandT/admin/product/handbags?handbagsgallery");
									xhr.onload = function() {
										window.location
												.assign("/ShopTandT/admin/product/handbags");
									};
									xhr.send();
								});
			}
		</script>
	</c:if>

	<script type="text/javascript">
		$(function() {
			// Multiple images preview in browser
			var imagesPreview = function(input, placeToInsertImagePreview) {
				if (input.files) {
					var filesAmount = input.files.length;
					for (i = 0; i < filesAmount; i++) {
						var reader = new FileReader();
						reader.onload = function(event) {
							$($.parseHTML('<img>')).attr('src',
									event.target.result).appendTo(
									placeToInsertImagePreview);
						}
						reader.readAsDataURL(input.files[i]);
					}
				}
			};
			$('#filetag').on('change', function() {
				$("#gallery img").remove();
				imagesPreview(this, 'div.gallery');
			});
		});
	</script>

	<script type="text/javascript">
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
</body>
</html>