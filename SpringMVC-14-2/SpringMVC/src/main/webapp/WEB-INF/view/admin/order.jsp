<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value ="/assets/css/admin-order.css"/>">
<link rel="stylesheet" href="<c:url value='/assets/css/admin-login.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/search.css'/>">

<c:if test="${ management == 'true' }">
	<title>Order management :)</title>
</c:if>
<c:if test="${ editorder == 'true' }">
	<title>Edit order :)</title>
</c:if>
<c:if test="${ search == 'true' }">
	<title>Search order :)</title>
</c:if>
<c:if test="${ orderdetails == 'true' }">
	<title>Order details :)</title>
</c:if>

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
		
		<c:if test="${ editorder == 'false' &&  management == 'false' && orderdetails == 'false' }">
			<section class="admin-order-management importantNone">
		</c:if>

		<div class="title title-add-new importantNone">
			<img
				src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
				alt="">
			<h1>ADD NEW</h1>
		</div>

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

			<div class="addneworder-nav importantNone">
				<p>/</p>
				<img
					src="<c:url value="/assets/images/icons/icons8-add-64-title.png"/>"
					alt=""> <a href="">Add new</a>
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
					<th colspan="1000" class="td-addneworder">
						<button class="addneworder" id="addneworder" name="">
							<img
								src="<c:url value="/assets/images/icons/icons8-add-64.png"/>"
								alt="icon-plus"> Add New
						</button>
					</th>
				</tr>
				<tr>
					<th>ID</th>
					<th>Fullname</th>
					<th>Email</th>
					<th>Phone number</th>
					<th>Address</th>
					<th>Order date</th>
					<th>Note</th>
					<th>Status</th>
					<th class="td-action">Action</th>
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
						<td class="td-action">
							<c:if test="${ liOrder.status.id == 1 }">
								<button class="btn-confirm-order" id="${ liOrder.id }">
									<img
										src="<c:url value="/assets/images/icons/icons8-done-64.png"/>"
										alt="">
								</button>
							</c:if>
							<c:if test="${ liOrder.status.id != 1 }">
								<button class="btn-confirm-order" style="background: #666;" id="${ liOrder.id }" disabled="disabled">
									<img
										src="<c:url value="/assets/images/icons/icons8-done-64.png"/>"
										alt="">
								</button>
							</c:if>
							<button class="btn-edit-product editneworder" id="${liOrder.id }">
								<img
									src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
									alt="">
							</button>
							<button class="btn-details-order" id="${liOrder.id }">
								<img
									src="<c:url value="/assets/images/icons/icons8-eye-64.png"/>"
									alt="">
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="add-new-order-form importantNone">
		<div class="customer-infor">
			<h3>Customer information</h3>
			<div class="customer-infor-form">
				<div class="fullname">
					<label> Full name: </label> <input type="text">
				</div>
				<div class="email">
					<label> Email: </label> <input type="text">
				</div>
				<div class="phone-number">
					<label> Phone number: </label> <input type="text">
				</div>
				<div class="address">
					<label> Address: </label> <input type="text">
				</div>
			</div>
		</div>
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
			<div class="fullname">
				<p>Order date</p>
				<input type="text" value="${ orderById.order_date }" readonly>
			</div>
			<div class="email">
				<p>Updated at</p>
				<input type="text" value="${ orderById.updated_at }" readonly>
			</div>
			<div class="phone-number">
				<p>Method</p>
				<input type="text" value="${ orderById.method }" readonly>
			</div>
			<div class="address">
				<p>Voucher</p>
				<input type="text" value="${ orderById.voucher.code }" readonly>
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
				<div class="id">
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
			</div>
		</c:if>
		
		<c:if test="${ orderdetails == 'true'}">
			<div class="customer-infor-form">
				<div class="id">
					<p>Status</p>
					<input type="text" value="${ orderById.status.status_name }" readonly>
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
							<td class="td-display-center quantity-order">${ liProdInOrder.quantity }</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<c:if test="${ editorder == 'true'}">
			<div class="saved-order">
				<button class="btn-save" name="" id="${ orderById.id }">Save</button>
			</div>
		</c:if>
	
		
	</div>
	</div>
	</section>
	<!-- ORDER SEARCH -->
	<c:if test="${ search == 'false' }">
		<section class="admin-order-search none">
	</c:if>
	<c:if test="${ search == 'true' }">
		<section class="admin-order-search">
	</c:if>
	<div class="title">
		<img
			src="<c:url value="/assets/images/icons/icons8-search-client-60.png"/>"
			alt="">
		<h1>SEARCH ORDER</h1>
	</div>
	<div class="nav-history">
		<div class="origin">
			<img
				src="<c:url value="/assets/images/icons/icons8-home-page-64.png"/>"
				alt=""> <a href="">Home</a>
		</div>
		<p>/</p>
		<div>
			<img
				src="<c:url value="/assets/images/icons/icons8-purchase-order-100-nav.png"/>"
				alt=""> <a href="">Order</a>
		</div>
		<p>/</p>
		<div>
			<img
				src="<c:url value="/assets/images/icons/icons8-search-client-60.png"/>"
				alt=""> <a href="">Search order</a>
		</div>
	</div>
	<div class="table-order">
		<table class="order">
			<thead>
				<tr>
					<th colspan="1000" class="td-addneworder">
						<div class="search-role">
							<div class="search-role-img">
								<img
									src="<c:url value="/assets/images/icons/icons8-search-50-blue.png"/>"
									alt="icon-search">
							</div>
							<div class="search-role-input">
								<input type="text" id="search-voucher" placeholder="Search..."
									value="${ keyword }">
							</div>
						</div>
					</th>
				</tr>
				<tr>
					<th>ID</th>
					<th>Fullname</th>
					<th>Email</th>
					<th>Phone number</th>
					<th>Address</th>
					<th>Order date</th>
					<th>Note</th>
					<th>Status</th>
					<th class="td-action">Action</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Maria Anders</td>
					<td>Germany</td>
					<td>Alfreds Futterkiste</td>
					<td>Maria Anders</td>
					<td>Germany</td>
					<td>Alfreds Futterkiste</td>
					<td>Maria Anders</td>
					<td class="td-action">
						<button class="btn-edit-order">
							<img
								src="<c:url value="/assets/images/icons/icons8-edit-100.png"/>"
								alt="">
						</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</section>
	</div>

	<div class="message msg-order none">
		<h2>Message</h2>
		<p class="content-msg"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" type="button" value="Cancel"> <input
				class="ok hover-btn" type="button" value="OK">
		</div>
	</div>

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript">
	$('.btn-save').click(function() {
		var id_order = this.id;
		var status = document.getElementById("selected-order").value;
		var origin = window.location.origin;
		$(".message").addClass("none");
		setTimeout(function() {
			$(".msg-done").removeClass("importantNone");
		}, 0);
		setTimeout(function() {
			$(".msg-done").addClass("importantNone");
		}, 3000);
		setTimeout(function() {
			var xhr = new XMLHttpRequest();
			xhr.open("GET", origin
					+ "/SpringMVC/admin/order-management?id_order="+id_order+"&status="+status);
			// What to do when server responds
			xhr.onload = function() {
				window.location.assign(origin
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
		});
	</script>
	<script>
		$('.btn-confirm-order').click(
				function() {
					$(".message").removeClass("none");
					$(".content-msg").text(
							"Are you sure you want to browse this order?");
					var id_order = this.id;
					$('.ok').click(function() {
						$(".message").addClass("none");
						setTimeout(function() {
							$(".msg-done").removeClass("importantNone");
						}, 10);
						setTimeout(function() {
							$(".msg-done").addClass("importantNone");
						}, 500);
						setTimeout(function() {
							var xhr = new XMLHttpRequest();
							xhr.open("GET", origin
									+ "/SpringMVC/admin/order-management?id_order="+id_order+"&status=2");
							// What to do when server responds
							xhr.onload = function() {
								window.location.assign(origin
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
					xhr.open("GET", window.location.href
							+ "/edit-order");
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
					xhr.open("GET", window.location.href
							+ "/order-details");
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