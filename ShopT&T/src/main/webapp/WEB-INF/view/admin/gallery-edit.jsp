
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Add Gallery</title>

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

.table-add-new-product {
	margin-top: 0;
	margin-left: 0;
	width: 100%;
}

.id-new-product {
	margin-top: 20px;
	width: 100%;
}

.selected-add-new-product {
	height: 40px;
}

.btn-add-new-product input {
	cursor: pointer;
}

.id-new-product-size {
	margin-top: 20px;
}

.list-size-add-new-product {
	margin-bottom: 15px;
	width: 93%;
}

.btn-add-new-product {
	margin-top: 0;
	margin-left: -30px;
}

.list-size-add-new-product span {
	height: 40px;
	width: 40px;
	justify-content: unset;
	padding: 0 10px;
}

.list-size-add-new-product input {
	width: 80px;
	margin-left: 10px;
}

table.table-new-product {
	margin-top: 30px;
	width: 100%;
}

.img-display {
	max-width: 540px;
	height: 540px;
	overflow: hidden;
	justify-content: center;
	display: flex;
}

.selected-add-new-product {
	width: 90%;
}

input.cancel {
	width: 124px;
}

.gallery {
	width: 515px;
	height: 537px;
	overflow-y: scroll;
	overflow-x: hidden;
}

.gallery img {
	width: 100%;
}

.id-new-product input {
	width: 90%;
	height: 40px;
	padding-left: 10px;
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
						src="<c:url value="/assets/images/icons/icons8-dirty-clothes-100.png"/>"
						alt=""> <a href="">Products</a>
				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-dirty-clothes-100.png"/>"
						alt=""> <a href="/ShopTandT/admin/gallery/">Gallery</a>
				</div>
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
						alt=""> <a href="">Add new Gallery</a>
				</div>
			</div>

			<div class="table-add-new-product">
				<form action="/ShopTandT/admin/gallery/update/savefile/${ gallery.id }" method="post"
					enctype="multipart/form-data">
					<table class="table-new-product">
						<tr>
							<td>
								<div class="id-new-product">
									<p>Gallery</p>
									<input id="galleryid" name="galleryid" value="${ gallery.id }"
										readonly="readonly" style="background-color: #f9e1ee;">
								</div>
								<div class="id-new-product">
									<p>Product</p>
									<select class="selected-add-new-product" id="select-product"
										name="product">
										<option value="" disabled="disabled" selected>Choose
											product</option>
										<c:forEach var="liProduct" items="${ listProduct }">
											<c:if test="${ gallery.product.id == liProduct.id}">
												<option value="${ liProduct.id }" selected>${ liProduct.id }
													- ${ liProduct.title }</option>
											</c:if>
											<c:if test="${ gallery.product.id != liProduct.id}">
												<option value="${ liProduct.id }">${ liProduct.id }
													- ${ liProduct.title }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</td>
							<td rowspan="4" class="td-img-display">
								<div class="gallery" id="gallery">
									<img
										src="<c:url value="/assets/images/products/${ gallery.thumbnail }"/>"
										alt="">
								</div>
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
									<input type="button" value="Save" id="btn-savenewproduct"
										name="btn-savenewproduct">
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<jsp:include page="../layouts/admin/a-footer.jsp"></jsp:include>
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
		$("#btn-savenewproduct").click(function() {
			$(this).attr('type', 'submit');
		});
	</script>

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