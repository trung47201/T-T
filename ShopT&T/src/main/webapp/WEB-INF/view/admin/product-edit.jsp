<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${ productedit == 'true' }">
	<title>Update :)</title>
</c:if>
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-product.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-login.css'/>">

<style>
td {
	width: 20%;
}

td#colspan2 {
	width: 40%;
}

td#colspan2 .id-new-product {
	width: 96%;
}

.disable-bg {
	background: lightcyan;
}

.id-new-product input {
	width: 100% !important;
}

.img-display {
	max-width: 465px;
	height: 400px;
	margin-top: 15px;
}

.phone-number textarea {
    width: 96%;
    max-width: 96%;
    max-height: 250px;
    height: 250px;
    min-height: 250px;
}
.phone-number, .id-new-product {
    margin-top: 15px;
}
.table-add-new-product {
    margin-top: 0px !important;
}
.btn-add-new-product input {
    float: right;
    padding: 8px 30px;
    font-size: 18px;
    border: 1px solid white;
    color: white;
    font-weight: bold;
    background: #0086ff;
    border-radius: 5px;
    box-shadow: 0 0 5px #0086ff;
}
.btn-add-new-product input:hover {
cursor: pointer;
}
</style>

<body>
	<jsp:include page="../layouts/admin/login.jsp"></jsp:include>
	<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>

		<!-- PRODUCT -->

		<c:if test="${ productedit == 'true' }">
			<section class="admin-shoes-product">
				<div class="title">
					<img
						src="<c:url value="/assets/images/icons/icons8-edit-100-title.png"/>"
						alt="">
					<h1>PROCUCT UPDATE</h1>
				</div>
		</c:if>
		<c:if test="${ productedit == 'false'}">
			<section class="admin-shoes-product none">
		</c:if>

		<div class="nav-history">
			<div class="origin">
				<img
					src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
					alt=""> <a href="/SpringMVC/admin">Home</a>
			</div>

			<div>
				<p>/</p>
				<img
					src="<c:url value="/assets/images/icons/icons8-trainers-100-title.png"/>"
					alt=""> <a href="">Shoes</a>
			</div>

			<div>
				<p>/</p>
				<img
					src="<c:url value="/assets/images/icons/icons8-used-product-100-title.png"/>"
					alt=""> <a href="/SpringMVC/admin/product">Product</a>
			</div>

			<c:if test="${ productedit == 'true' }">
				<div>
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-edit-100-title.png"/>"
						alt=""> <a href="">Product update</a>
				</div>
			</c:if>
		</div>

		<c:if test="${ productedit == 'true' }">
			<div class="table-add-new-product">
		</c:if>
		<c:if test="${ productedit == 'false' }">
			<div class="table-add-new-product importantNone">
		</c:if>
		<form
			action="http://localhost:8888/SpringMVC/admin/product/edit/saveproduct/${ id }"
			method="post" enctype="multipart/form-data">
			<table class="table-new-product">
				<tr>
					<td>
						<div class="id-new-product">
							<p>ID</p>
							<input class="disable-bg" type="text" id="id" name="id"
								value="${ product.id }" disabled="disabled">
						</div>
					</td>
					<td>
						<div class="id-new-product">
							<p>Price</p>
							<input type="text" id="price" name="price"
								value="${ product.price }">
						</div>
					</td>

					<td>
						<div class="id-new-product">
							<p>Discount</p>
							<input type="text" id="discount" name="discount"
								value="${ product.discount }">
						</div>
					</td>
					<td>
						<div class="id-new-product" id="id-new-product">
							<p>Image</p>
							<input type="file" id="filetag" name="filetag">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="id-new-product">
							<p>Style</p>
							<select class="selected-add-new-product" id="select-style"
								name="style">
								<option value="" disabled="disabled" selected>Choose
									style</option>
								<c:forEach var="liStyle" items="${ style }">
									<c:if test="${ liStyle.id == product.style.id }">
										<option value="${ liStyle.id }" selected>${ liStyle.style_name }</option>
									</c:if>
									<c:if test="${ liStyle.id != product.style.id }">
										<option value="${ liStyle.id }">${ liStyle.style_name }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</td>
					<td>
						<div class="id-new-product">
							<p>Brand</p>
							<select class="selected-add-new-product" id="select-brand"
								name="brand">
								<option value="" disabled="disabled" selected>Choose
									brand</option>
								<c:forEach var="liBrand" items="${ brand }">
									<c:if test="${ liBrand.id == product.brand.id}">
										<option value="${ liBrand.id }" selected>${ liBrand.brand_name }</option>
									</c:if>
									<c:if test="${ liBrand.id != product.brand.id}">
										<option value="${ liBrand.id }">${ liBrand.brand_name }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</td>
					<td>
						<div class="id-new-product">
							<p>Gender</p>
							<select class="selected-add-new-product" id="select-gender"
								name="gender">
								<option value="" disabled="disabled" selected>Choose
									gender</option>
								<c:forEach var="liGender" items="${ gender }">
									<c:if test="${ liGender.id == product.gender.id }">
										<option value="${ liGender.id }" selected>${ liGender.gender_name }</option>
									</c:if>
									<c:if test="${ liGender.id != product.gender.id }">
										<option value="${ liGender.id }">${ liGender.gender_name }</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</td>
					<td rowspan="3" class="td-img-display">
						<div class="img-display">
							<img
								src="<c:url value='/assets/images/products/${ product.thumbnail }' />"
								id="preview">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3" id="colspan2">
						<div class="id-new-product">
							<p>Title</p>
							<input type="text" id="title" name="title"
								value="${ product.title }">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="phone-number">
							<p>Description</p>
							<textarea maxlength="500" id="txt-description" name="description">${ des }</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="btn-add-new-product">
							<input type="button" value="Save" id="btn-addnewproduct"
								name="btn-addnewproduct">
						</div>
					</td>
				</tr>

			</table>
		</form>

	</div>
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
					var brand = $('#select-brand').find(":selected").val();
					var description = $("#txt-description").val();
					var error = "";

					if (title == "") {
						error += "Title is empty! \n";
					}
					if (price == "") {
						error += "Price is empty! \n";
					}
					if (discount == "") {
						error += "Discount is empty! \n";
					}
					if (style == "") {
						error += "You haven't chosen a style yet!! \n";
					}
					if (gender == "") {
						error += "You haven't chosen a gender yet!! \n";
					}
					if (brand == "") {
						error += "You haven't chosen a brand yet!! \n";
					}
					if (description == "") {
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

	<script>
		$('.other').click(function() {
			$(".other-menu").removeClass("none", 10000, "easeInBack");
		});
	</script>

	<script>
		$(document).ready(function() {
			$(".admin-menu-icon").click(function() {
				$(".navigation").toggle("none");
			});
		});
	</script>


	<script>
		var arrDiv = document.getElementsByClassName("menu");
		var arrP = document.getElementsByClassName("dropdown-menu");
		$(document).ready(function() {
			$(".menu").click(function() {
				var classSubMenu = "." + this.id;
				$(classSubMenu).toggle("none");
				for (let i = 0; i < arrP.length; i++) {
					if (arrP[i].className.includes(this.id)) {
						$(arrP[i]).toggleClass("rotate");
					}
				}
			});
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
</body>

</html>