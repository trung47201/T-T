<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>Add Color Size :)</title>

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
	margin-top: 40px;
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
					action="http://localhost:8888/ShopTandT/admin/product/add-product-color-size"
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
												style="background-color: ${ liColor.rgb };">${ liColor.id } - ${ liColor.color_name }</option>
										</c:forEach>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="id-new-product-size">
									<p>Size & Quantity</p>
									<div class="list-size-add-new-product">
										<span id="1" onclick="size(this)">32<input class="none"
											id="1" name="size32" type="number" placeholder="Qty"></span>
										<span id="2" onclick="size(this)">33<input class="none"
											id="2" name="size33" type="number" placeholder="Qty"></span>
										<span id="3" onclick="size(this)">34<input class="none"
											id="3" name="size34" type="number" placeholder="Qty"></span>
										<span id="4" onclick="size(this)">35<input class="none"
											id="4" name="size35" type="number" placeholder="Qty"></span>
										<span id="5" onclick="size(this)">36<input class="none"
											id="5" name="size36" type="number" placeholder="Qty"></span>
										<span id="6" onclick="size(this)">37<input class="none"
											id="6" name="size37" type="number" placeholder="Qty"></span>
										<span id="7" onclick="size(this)">38<input class="none"
											id="7" name="size38" type="number" placeholder="Qty"></span>
										<span id="8" onclick="size(this)">39<input class="none"
											id="8" name="size39" type="number" placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="9" onclick="size(this)">40<input class="none"
											id="9" name="size40" type="number" placeholder="Qty"></span>
										<span id="10" onclick="size(this)">41<input
											class="none" id="10" name="size41" type="number"
											placeholder="Qty"></span> <span id="11" onclick="size(this)">42<input
											class="none" id="11" name="size42" type="number"
											placeholder="Qty"></span> <span id="12" onclick="size(this)">43<input
											class="none" id="12" name="size43" type="number"
											placeholder="Qty"></span> <span id="13" onclick="size(this)">44<input
											class="none" id="13" name="size44" type="number"
											placeholder="Qty"></span> <span id="14" onclick="size(this)">45<input
											class="none" id="14" name="size45" type="number"
											placeholder="Qty"></span> <span id="15" onclick="size(this)">46<input
											class="none" id="15" name="size46" type="number"
											placeholder="Qty"></span> <span id="16" onclick="size(this)">47<input
											class="none" id="16" name="size47" type="number"
											placeholder="Qty"></span>
									</div>
									<div class="list-size-add-new-product">
										<span id="18" onclick="size(this)">XS<input
											class="none" id="18" name="sizeXS" type="number"
											placeholder="Qty"></span> <span id="19" onclick="size(this)">S<input
											class="none" id="19" name="sizeS" type="number"
											placeholder="Qty"></span> <span id="20" onclick="size(this)">M<input
											class="none" id="20" name="sizeM" type="number"
											placeholder="Qty"></span> <span id="21" onclick="size(this)">L<input
											class="none" id="21" name="sizeL" type="number"
											placeholder="Qty"></span> <span id="22" onclick="size(this)">XL<input
											class="none" id="22" name="sizeXL" type="number"
											placeholder="Qty"></span> <span id="23" onclick="size(this)">2XL<input
											class="none" id="23" name="size2XL" type="number"
											placeholder="Qty"></span> <span id="24" onclick="size(this)">3XL<input
											class="none" id="24" name="size3XL" type="number"
											placeholder="Qty"></span> <span id="" style="visibility: hidden;"><input
											class="none" type="number"
											placeholder="Qty"></span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
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
					var product = $('#select-product').find(":selected").val();
					var color = $('#select-color').find(":selected").val();
					var arrSize = $('.list-size-add-new-product span input')
							.not('.none');

					var error = "";

					if (product == "") {
						error += "You haven't chosen a product yet!! \n";
					} else if (color == "") {
						error += "You haven't chosen a color yet!! \n";
					} else if (arrSize.length <= 0) {
						error += "You haven't chosen a size yet!! \n";
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
	<!-- get string size -->
		function getSize(arr) {
			var txt = "";
			if (arr.length > 0) {
				for (let i = 0; i < arr.length; i++) {
					if (i == (arr.length - 1)) {
						txt += arr[i].id + "_" + arr[i].value;
					} else {
						txt += arr[i].id + "_" + arr[i].value + "/";
					}
				}
			}
			return txt;
		}
	</script>
	<!--  show input to enter quantity when click on size box -->
	<script>
		$(".list-size-add-new-product span").click(function() {
			let checkspan = this.classList;

			if (checkspan == "setcolor") {
				let txt = ".list-size-add-new-product #" + this.id + " input";

				if ($(txt).is(':focus')) {

				} else {
					$(txt).addClass("none");
					$(this).removeClass("setcolor");
				}

			} else {
				let txt = ".list-size-add-new-product #" + this.id + " input";
				$(txt).removeClass("none");
				$(this).addClass("setcolor");
			}
		});
	</script>

	<script type="text/javascript">
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
</body>
</html>