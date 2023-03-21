<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value ="/assets/css/admin-order.css"/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/admin-login.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/search.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/message.css'/>">
<c:if test="${ management == 'true' }">
	<title>Order management :)</title>
</c:if>
<c:if test="${ editorder == 'true' }">
	<title>Edit order :)</title>
	<style>
th#date {
	min-width: 105px;
}

.table-order thead {
	background-color: white;
}

.table-product-order-edit {
	max-height: 197px !important;
	overflow-y: scroll;
}

div#customer-infor-form div {
	float: right;
	display: flex;
	width: 98.3%;
	justify-content: right;
	font-size: 20px;
	align-items: center;
	font-weight: bold;
	color: black;
}

p#total {
	margin-left: 20px;
	color: #ff4200;
	font-size: 32px;
	font-weight: bold;
	margin-top: 4px;
}
</style>
</c:if>
<c:if test="${ orderdetails == 'true' }">
	<title>Order details :)</title>
	<style>
th#date {
	min-width: 105px;
}

.table-order thead {
	background-color: white;
}

.table-product-order-edit {
	max-height: 250px !important;
	overflow-y: scroll;
}

div#customer-infor-form div {
	float: right;
	display: flex;
	width: 98.3%;
	justify-content: right;
	font-size: 20px;
	align-items: center;
	font-weight: bold;
	color: black;
}

p#total {
	margin-left: 20px;
	color: #ff4200;
	font-size: 32px;
	font-weight: bold;
	margin-top: 4px;
}
</style>
</c:if>

<style>
.btn-details-order {
	background-color: purple !important;
}
.status-input {
	width: 100% !important;
	min-width: 200px;
}
.btn-confirm {
	background-color: #0086ff;
	border: 0;
	width: 32px;
	height: 32px;
	border-radius: 5px 0 0 5px;
	box-shadow: -1px 0 2px #29333f;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 10px;
}

.btn-confirm img {
	width: 80%;
}

.message input {
	width: unset !important;
	height: unset !important;
}

.selected-order {
	width: 100% !important;
	height: 28px;
	padding: 0px 5px 0 5px;
	border: 0;
	font-size: 18px;
	border-left: 2px solid #0086ff;
	min-width: 200px;
}

div#status-select {
	width: 37.2%;
}
</style>

<body>
	<jsp:include page="../layouts/admin/login.jsp"></jsp:include>
	<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>
		<!-- ORDER MANAGEMENT -->

		<c:if test="${ management == 'true' }">
			<section class="admin-order-management">
				<div class="title title-order-management">
					<img
						src="<c:url value="/assets/images/icons/icons8-calendar-96.png"/>"
						alt="">
					<h1>ORDER MANAGEMENT</h1>
				</div>
		</c:if>
		<c:if test="${ editorder == 'true' }">
			<section class="admin-order-management">
				<div class="title title-edit-new">
					<img
						src="<c:url value="/assets/images/icons/icons8-edit-100-title.png"/>"
						alt="">
					<h1>EDIT ORDER</h1>
				</div>
		</c:if>
		<c:if test="${ orderdetails == 'true' }">
			<section class="admin-order-management">
				<div class="title title-edit-new">
					<img
						src="<c:url value="/assets/images/icons/icons8-eye-64-title.png"/>"
						alt="">
					<h1>ORDER DEATAILS</h1>
				</div>
		</c:if>

		<c:if
			test="${ editorder == 'false' &&  management == 'false' && orderdetails == 'false' }">
			<section class="admin-order-management importantNone">
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
					src="<c:url value="/assets/images/icons/icons8-purchase-order-100-nav.png"/>"
					alt=""> <a href="">Order</a>
			</div>

			<div>
				<p>/</p>
				<img
					src="<c:url value="/assets/images/icons/icons8-calendar-96.png"/>"
					alt=""> <a href="/SpringMVC/admin/order-management">Management</a>
			</div>

			<c:if test="${ orderdetails == 'true' }">
				<div class="editneworder-nav">
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-eye-64-title.png"/>"
						alt=""> <a href="">Order details</a>
				</div>
			</c:if>
			<c:if test="${ editorder == 'true' }">
				<div class="editneworder-nav">
					<p>/</p>
					<img
						src="<c:url value="/assets/images/icons/icons8-edit-100-title.png"/>"
						alt=""> <a href="">Edit order</a>
				</div>
			</c:if>
		</div>
		<c:if test="${ management == 'true' }">
			<div class="table-order table-order-add">
		</c:if>
		<c:if test="${ management == 'false' }">
			<div class="table-order table-order-add importantNone">
		</c:if>
		<table class="order">
			<thead>
				<tr>
					<th>ID</th>
					<th>Fullname</th>
					<th>Email</th>
					<th>Phone number</th>
					<th>Address</th>
					<th id="date" style="min-width: 105px;">Order date</th>
					<th>Note</th>
					<th>Status</th>
					<th style="text-align: center;">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="liOrder" items="${ listOrder }" varStatus="index">
					<tr>
						<td>${ liOrder.id }</td>
						<td>${ liOrder.fullname }</td>
						<td>${ liOrder.email }</td>
						<td>${ liOrder.phone_number }</td>
						<td>${ liOrder.address }</td>
						<td>${ liOrder.order_date }</td>
						<td>${ liOrder.note }</td>
						<td>${ liOrder.status.status_name }</td>
						<td class="td-action"><c:if
								test="${ liOrder.status.id == 6 }">
								<button class="btn-details-order" id="${liOrder.id }"
									style="border-radius: 5px;">
									<img
										src="<c:url value="/assets/images/icons/icons8-eye-64.png"/>"
										alt="">
								</button>
							</c:if> <c:if test="${ liOrder.status.id != 6 }">
								<c:if test="${ liOrder.status.id == 1 }">
									<button class="btn-confirm-order" id="${ liOrder.id }">
										<img
											src="<c:url value="/assets/images/icons/icons8-done-64.png"/>"
											alt="">
									</button>
								</c:if>
								<c:if test="${ liOrder.status.id != 1 }">
									<c:if test="${ liOrder.request == 1 }">
										<button class="btn-confirm" style="background: red;"
											id="${ liOrder.id }" name="${ liOrder.id }">
											<img
												src="<c:url value="/assets/images/icons/icons8-close-64.png"/>"
												alt="">
										</button>
									</c:if>
									<c:if test="${ liOrder.request != 1 }">
										<button class="btn-confirm-order" style="background: #666;"
											id="${ liOrder.id }" disabled="disabled">
											<img
												src="<c:url value="/assets/images/icons/icons8-done-64.png"/>"
												alt="">
										</button>
									</c:if>
								</c:if>
								<button class="btn-edit-product editneworder"
									id="${liOrder.id }">
									<img
										src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
										alt="">
								</button>
								<button class="btn-details-order" id="${liOrder.id }">
									<img
										src="<c:url value="/assets/images/icons/icons8-eye-64.png"/>"
										alt="">
								</button>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${ editorder == 'false' && orderdetails == 'false' }">
		<div class="edit-new-order-form importantNone">
	</c:if>
	<c:if test="${ editorder == 'true'}">
		<div class="edit-new-order-form">
	</c:if>

	<c:if test="${ orderdetails == 'true'}">
		<div class="edit-new-order-form">
	</c:if>

	<div class="customer-infor">

		<div class="customer-infor-form">
			<div class="id">
				<p>ID</p>
				<input type="text" value="${ orderById.id }" readonly>
			</div>
			<div class="id">
				<p>Discount</p>
				<input type="text" value="${ orderById.discount_at }" readonly>
			</div>
			<div class="address">
				<p>Voucher</p>
				<input type="text" value="${ orderById.voucher.code }" readonly>
			</div>
			<div class="id">
				<p>Bill</p>
				<input type="text" value="${ orderById.bill }" readonly>
			</div>
			<div class="phone-number">
				<p>Method</p>
				<input type="text" value="${ orderById.method }" readonly>
			</div>
		</div>
		<div class="customer-infor-form">
			<div class="fullname">
				<p>Full name</p>
				<input type="text" value="${ orderById.fullname }" readonly>
			</div>
			<div class="email">
				<p>Email</p>
				<input type="text" value="${ orderById.email }" readonly>
			</div>
			<div class="phone-number">
				<p>Phone number</p>
				<input type="text" value="${ orderById.phone_number }" readonly>
			</div>
			<div class="address">
				<p>Address</p>
				<input type="text" value="${ orderById.address }" readonly>
			</div>
			<div class="id">
				<p>Note</p>
				<input type="text" value="${ orderById.note }" readonly>
			</div>
		</div>
		<c:if test="${ editorder == 'true'}">
			<div class="customer-infor-form">
				<div class="id" id="status-select">
					<p>Status</p>
					<select class="selected-order status" id="selected-order">
						<option value="">Choose status</option>
						<c:forEach var="liStatus" items="${ listStatus }">
							<c:if test="${ orderById.status.id == liStatus.id }">
								<option value="${liStatus.id }" selected>${ liStatus.status_name }</option>
							</c:if>
							<c:if test="${ orderById.status.id != liStatus.id }">
								<option value="${liStatus.id }">${ liStatus.status_name }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="fullname">
					<p>Order date</p>
					<input type="text" value="${ orderById.order_date }" readonly>
				</div>
				<div class="email">
					<p>Updated at</p>
					<input type="text" value="${ orderById.updated_at }" readonly>
				</div>
				<div class="id">
					<p>Request</p>
					<input type="text" value="${ orderById.request }" readonly>
				</div>
			</div>
		</c:if>

		<c:if test="${ orderdetails == 'true'}">
			<div class="customer-infor-form">
				<div class="id" id="status-select">
					<p>Status</p>
					<c:if test="${ orderById.status.id == 6 }">
						<input class="status-input" type="text" value="${ orderById.status.status_name }"
							readonly style="color: red;">
					</c:if>
					<c:if test="${ orderById.status.id != 6 }">
						<input class="status-input" type="text" value="${ orderById.status.status_name }"
							readonly>
					</c:if>
				</div>
				<div class="fullname">
					<p>Order date</p>
					<input type="text" value="${ orderById.order_date }" readonly>
				</div>
				<div class="email">
					<p>Updated at</p>
					<input type="text" value="${ orderById.updated_at }" readonly>
				</div>
				<div class="id">
					<p>Request</p>
					<input type="text" value="${ orderById.request }" readonly>
				</div>
			</div>
		</c:if>
		<div class="customer-infor-form table-product-order-edit">
			<table class="order product-order">
				<thead>
					<tr>
						<th></th>
						<th>Name</th>
						<th>Price</th>
						<th class="td-display-center">Color</th>
						<th class="td-display-center">Size</th>
						<th class="td-display-center">Quantity</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="liProdInOrder" items="${ orderDetailsById }"
						varStatus="index">
						<tr>
							<td class="td-img-product"><img
								src="<c:url value='/assets/images/products/${ liProdInOrder.prod.thumbnail }'/>"
								alt="img-prod"></td>

							<td>${ liProdInOrder.prod.title }</td>
							<td>$${ liProdInOrder.price_at }</td>

							<td class="td-display-center">${ liProdInOrder.color.color_name }</td>
							<td class="td-display-center">${ liProdInOrder.size.size_number }</td>
							<td class="td-display-center quantity-order">${ liProdInOrder.quantity }
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="customer-infor-form" id="customer-infor-form">
			<div>
				Total:
				<p id="total">$${ total }</p>
			</div>
		</div>
		<c:if test="${ editorder == 'true'}">
			<div class="saved-order">
				<button class="btn-save" name="" id="${ orderById.id }">Save</button>
			</div>
		</c:if>


	</div>
	</div>
	</section>

	</div>

	<div class="message msg-order message-notify none" id="message-notify">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-notify">
			Are you sure you want to <b>countermand</b> this order?
		</p>
		<div class="btn-ok-cancel">
			<input class="cancel" id="cancel" type="button" value="Cancel">
			<input class="ok" id="ok-notify" type="button" value="OK">
		</div>
	</div>

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript">
		$(".btn-confirm").click(
				function() {
					var url = window.location.href;
					$(".message").removeClass("none");
					var id_order = this.id;
					$('.ok').click(
							function() {
								$(".message").addClass("none");
								setTimeout(
										function() {
											$(".msg-done").removeClass(
													"importantNone");

										}, 0);
								setTimeout(function() {
									$(".msg-done").addClass("importantNone");

								}, 500);
								var xhr = new XMLHttpRequest();
								xhr.open("GET",
										"http://localhost:8888/SpringMVC/admin/order-management/countermand/"
												+ id_order);
								xhr.onload = function() {
									location.reload();
								};
								xhr.send();
							});
				});
	</script>

	<script type="text/javascript">
		$('.btn-save')
				.click(
						function() {
							var id_order = this.id;
							var status = document
									.getElementById("selected-order").value;
							var origin = window.location.origin;
							$(".message").addClass("none");
							setTimeout(function() {
								$(".msg-done").removeClass("importantNone");
							}, 0);
							setTimeout(function() {
								$(".msg-done").addClass("importantNone");
							}, 3000);
							setTimeout(
									function() {
										var xhr = new XMLHttpRequest();
										xhr
												.open(
														"GET",
														origin
																+ "/SpringMVC/admin/order-management?id_order="
																+ id_order
																+ "&status="
																+ status);
										// What to do when server responds
										xhr.onload = function() {
											window.location
													.assign(origin
															+ "/SpringMVC/admin/order-management");
										};
										xhr.send();
									}, 500);

						});
	</script>

	<script>
		function delProdInOrder(x) {
			$(".message").removeClass("none");
			$(".content-msg").text(
					"Are you sure you want to delete this order?");
			var id_prod = x.id;
			$('.ok').click(function() {
				$(".message").addClass("none");
				setTimeout(function() {
					$(".msg-done").removeClass("importantNone");

				}, 0);
				setTimeout(function() {
					$(".msg-done").addClass("importantNone");

				}, 500);
				$('.ok').removeData('clicked', true);
				location.reload();
			});
		}
	</script>

	<script>
		$('.cancel').click(function() {
			$(".message").addClass("none");
			location.reload();
		});
	</script>
	<script>
		$('.btn-confirm-order')
				.click(
						function() {
							$(".message").removeClass("none");
							$(".content-msg")
									.text(
											"Are you sure you want to browse this order?");
							var id_order = this.id;
							$('.ok')
									.click(
											function() {
												$(".message").addClass("none");
												setTimeout(function() {
													$(".msg-done").removeClass(
															"importantNone");
												}, 10);
												setTimeout(function() {
													$(".msg-done").addClass(
															"importantNone");
												}, 500);
												setTimeout(
														function() {
															var xhr = new XMLHttpRequest();
															xhr
																	.open(
																			"GET",
																			origin
																					+ "/SpringMVC/admin/order-management?id_order="
																					+ id_order
																					+ "&status=2");
															// What to do when server responds
															xhr.onload = function() {
																window.location
																		.assign(origin
																				+ "/SpringMVC/admin/order-management");
															};
															xhr.send();
														}, 500);
											});
						});
		$('.cancel').click(function() {
			$(".message").addClass("none");
		});
	</script>
	<script>
		$('.cancel').hover(function() {
			$(".ok").removeClass("hover-btn");
			$(".ok").removeClass("font-size-btn-msg");
			$(".cancel").addClass("hover-btn");
			$(".cancel").addClass("font-size-btn-msg");
		});
		$('.ok').hover(function() {
			$(".cancel").removeClass("hover-btn");
			$(".cancel").removeClass("font-size-btn-msg");
			$(".ok").addClass("hover-btn");
			$(".ok").addClass("font-size-btn-msg");
		});
	</script>
	<!-- ADD NEW ONCLICK-->
	<script>
		$('#addnewshoes-product').click(function() {
			$(".addneworder-nav").removeClass("importantNone");
			$(".table-order-add").addClass("importantNone");
			$(".title-add-new").removeClass("importantNone");
			$(".title-order-management").addClass("importantNone");
			$(".add-new-order-form").removeClass("importantNone");

		});
		$('#addneworder').click(function() {
			$(".addneworder-nav").removeClass("importantNone");
			$(".table-order-add").addClass("importantNone");
			$(".title-add-new").removeClass("importantNone");
			$(".title-order-management").addClass("importantNone");
			$(".add-new-order-form").removeClass("importantNone");

		});
		$('.editneworder').click(
				function() {
					var id_order = this.id;
					var xhr = new XMLHttpRequest();
					xhr.open("GET", window.location.href + "/edit-order");
					// What to do when server responds
					xhr.onload = function() {
						window.location.assign(window.location.href
								+ "/edit-order?id_order=" + id_order);
					};
					xhr.send();
				});
		$('.btn-details-order').click(
				function() {
					var id_order = this.id;
					var xhr = new XMLHttpRequest();
					xhr.open("GET", window.location.href + "/order-details");
					// What to do when server responds
					xhr.onload = function() {
						window.location.assign(window.location.href
								+ "/order-details?id_order=" + id_order);
					};
					xhr.send();
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


</body>

</html>