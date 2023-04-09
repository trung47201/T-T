<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Add Gallery :)</title>

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
						src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
						alt=""> <a href="">Add new Color Size</a>
				</div>
			</div>

			<div class="table-add-new-product">
				<form
					action="/ShopTandT/admin/gallery/add/savefile"
					method="post" enctype="multipart/form-data">
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
							<td rowspan="4" class="td-img-display">
								<div class="img-display">
									<img src="" id="preview">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="id-new-product">
									<p>Color</p>
									<select class="selected-add-new-product" id="select-color"
										name="color">
										<option value="" disabled="disabled" selected>Choose
											color</option>

										<c:forEach var="liColor" items="${ listColor }">
											<option value="${ liColor.id }"
												style="background-color: ${ liColor.rgb };">${ liColor.id }
												- ${ liColor.color_name }</option>
										</c:forEach>
									</select>
								</div>
							</td>

						</tr>
						<tr>
							<td>
								<div class="id-new-product">
									<p>Image</p>
									<input type="file" id="filetag" name="filetag">
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
		$("#btn-addnewproduct").click(
				function() {
					var product = $('#select-product').find(":selected").val();
					var color = $('#select-color').find(":selected").val();
					var file = $('input[type=file]').val();
					var error = "";

					if (product == "") {
						error += "You haven't chosen a product yet!! \n";
					} else if (color == "") {
						error += "You haven't chosen a color yet!! \n";
					} else if (file == "") {
						error += "You haven't chosen a image yet!! \n";
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
	
	
	<c:if test="${ sessionScope.addgallery != null }">
		<script type="text/javascript">
			var check = "${sessionScope.addgallery}";
			if(check =="true") {
				$("#gallery-add").removeClass("none");
				$("#gallery-add .content-msg-notify").text("Continue add gallery?");
				$("#gallery-add .ok-notify").click(function(){
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "/ShopTandT/admin/gallery/add?continue");
					xhr.onload = function() {
						window.location.assign("/ShopTandT/admin/gallery/add");
					};
					xhr.send();
				});
				$("#gallery-add .cancel").click(function(){
					window.location.href = "/ShopTandT/admin/gallery";
				});
			}
		</script>
	</c:if>
	
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
	<script type="text/javascript">
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
</body>
</html>