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

<title>Search order :)</title>

<style>
#search-voucher {
	width: 100% !important;
	background-size: 400% 100% !important;
}

.arrow-sort {
	display: flex;
	width: 100%;
	height: 20px;
}

th#date {
	min-width: 120px;
}

.rotate180 {
	rotate: 180deg;
}

.arrow-sort:hover {
	cursor: pointer;
}

#img-id:hover img, #img-fullname:hover img, #img-email:hover img,
	#img-address:hover img, #img-status:hover img, #img-order-date:hover img
	{
	rotate: 180deg;
}

th.th-action {
	text-align: center;
}

.message input {
	width: 111px !important;
	height: 36px !important;
}
</style>

<body>
	<jsp:include page="../layouts/admin/login.jsp"></jsp:include>
	<jsp:include page="../layouts/admin/header.jsp"></jsp:include>
	<div class="admin-body">
		<jsp:include page="../layouts/admin/nav.jsp"></jsp:include>
		<!-- ORDER MANAGEMENT -->

		<!-- ORDER SEARCH -->
		<section class="admin-order-search">
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
						alt=""> <a
						href="http://localhost:8888/SpringMVC/admin/search-order">Search
						order</a>
				</div>
			</div>

			<div class="request-search"></div>

			<div class="table-order">
				<table class="order">
					<thead>
						<tr>
							<th colspan="1000" class="td-addneworder">
								<div class="search-role">
									<div class="search-role-img" id="search-role-img">
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
							<th><div class="arrow-sort" id="img-id">
									ID<img
										src="<c:url value="/assets/images/icons/icons8-down-arrow-64.png"/>"
										alt="icon-arrow">
								</div></th>
							<th id="date"><div class="arrow-sort" id="img-fullname">
									Full name<img
										src="<c:url value="/assets/images/icons/icons8-down-arrow-64.png"/>"
										alt="icon-arrow">
								</div></th>
							<th><div class="arrow-sort" id="img-email">
									Email<img
										src="<c:url value="/assets/images/icons/icons8-down-arrow-64.png"/>"
										alt="icon-arrow">
								</div></th>
							<th>Phone number</th>
							<th><div class="arrow-sort" id="img-address">
									Address<img
										src="<c:url value="/assets/images/icons/icons8-down-arrow-64.png"/>"
										alt="icon-arrow">
								</div></th>
							<th id="date"><div class="arrow-sort" id="img-order-date">
									Order date<img
										src="<c:url value="/assets/images/icons/icons8-down-arrow-64.png"/>"
										alt="icon-arrow">
								</div></th>
							<th>Note</th>
							<th><div class="arrow-sort" id="img-status">
									Status<img
										src="<c:url value="/assets/images/icons/icons8-down-arrow-64.png"/>"
										alt="icon-arrow">
								</div></th>
							<th class="th-action">Action</th>
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
										test="${ liOrder.status.id == 1 }">
										<button class="btn-confirm-order" id="${ liOrder.id }">
											<img
												src="<c:url value="/assets/images/icons/icons8-done-64.png"/>"
												alt="">
										</button>
									</c:if> <c:if test="${ liOrder.status.id != 1 }">
										<button class="btn-confirm-order" style="background: #666;"
											id="${ liOrder.id }" disabled="disabled">
											<img
												src="<c:url value="/assets/images/icons/icons8-done-64.png"/>"
												alt="">
										</button>
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
									</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
	</div>

	<div class="message msg-order message-notify none" id="msg-old">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-notify" id="content-msg-notify"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" id="cancel" type="button" value="Cancel">
			<input class="ok" id="ok-notify" type="button" value="OK">
		</div>
	</div>
	<div class="message msg-order message-done none" id="message-done">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-done" id="content-msg-done"></p>
		<div class="btn-ok-cancel">
			<input class="ok" id="ok-done" type="button" value="OK">
		</div>
	</div>

	<div class="msg-done importantNone">Done!</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	<c:if test="${ listOrder == null }">
		<script type="text/javascript">
			$("#message-done").removeClass("none");
			$("#content-msg-done").text("No results were found!!");
		</script>
	</c:if>
	
	<script type="text/javascript"> //click id
		$("#img-id").click(function() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				if (url.includes("?sortby")) {
					if(url.includes("id-asc")) {
						url = url.replace("sortby=id-asc", "sortby=id-desc");
					} else if(url.includes("id-desc")) {
						url = url.replace("sortby=id-desc", "sortby=id-asc");
					} else {
						var arr = url.split("?");
						url = url.replace(arr[1], "sortby=id-desc");
					}
					window.location.assign(url);
				} else {
					window.location.assign("http://localhost:8888/SpringMVC/admin/search-order?sortby=id-asc");
				}
			};
			xhr.send();
		});
	</script>
	
	<script type="text/javascript"> //email
		$("#img-email").click(function() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				if (url.includes("?sortby")) {
					if(url.includes("email-asc")) {
						url = url.replace("sortby=email-asc", "sortby=email-desc");
					} else if(url.includes("email-desc")) {
						url = url.replace("sortby=email-desc", "sortby=email-asc");
					} else {
						var arr = url.split("?");
						url = url.replace(arr[1], "sortby=email-desc");
					}
					window.location.assign(url);
				} else {
					window.location.assign("http://localhost:8888/SpringMVC/admin/search-order?sortby=email-desc");
				}
			};
			xhr.send();
		});
	</script>
	
	<script type="text/javascript"> //fullname
		$("#img-fullname").click(function() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				if (url.includes("?sortby")) {
					if(url.includes("fullname-asc")) {
						url = url.replace("sortby=fullname-asc", "sortby=fullname-desc");
					} else if(url.includes("fullname-desc")) {
						url = url.replace("sortby=fullname-desc", "sortby=fullname-asc");
					} else {
						var arr = url.split("?");
						url = url.replace(arr[1], "sortby=fullname-desc");
					}
					window.location.assign(url);
				} else {
					window.location.assign("http://localhost:8888/SpringMVC/admin/search-order?sortby=fullname-desc");
				}
			};
			xhr.send();
		});
	</script>
	
	<script type="text/javascript"> // address
		$("#img-address").click(function() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				if (url.includes("?sortby")) {
					if(url.includes("address-asc")) {
						url = url.replace("sortby=address-asc", "sortby=address-desc");
					} else if(url.includes("address-desc")) {
						url = url.replace("sortby=address-desc", "sortby=address-asc");
					} else {
						var arr = url.split("?");
						url = url.replace(arr[1], "sortby=address-desc");
					}
					window.location.assign(url);
				} else {
					window.location.assign("http://localhost:8888/SpringMVC/admin/search-order?sortby=address-desc");
				}
			};
			xhr.send();
		});
	</script>
	
	<script type="text/javascript"> // order-date
		$("#img-order-date").click(function() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				if (url.includes("?sortby")) {
					if(url.includes("order-date-asc")) {
						url = url.replace("sortby=order-date-asc", "sortby=order-date-desc");
					} else if(url.includes("order-date-desc")) {
						url = url.replace("sortby=order-date-desc", "sortby=order-date-asc");
					} else {
						var arr = url.split("?");
						url = url.replace(arr[1], "sortby=order-date-desc");
					}
					window.location.assign(url);
				} else {
					window.location.assign("http://localhost:8888/SpringMVC/admin/search-order?sortby=order-date-desc");
				}
			};
			xhr.send();
		});
	</script>
	
	<script type="text/javascript"> // status
		$("#img-status").click(function() {
			var url = window.location.href;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				if (url.includes("?sortby")) {
					if(url.includes("status-asc")) {
						url = url.replace("sortby=status-asc", "sortby=status-desc");
					} else if(url.includes("status-desc")) {
						url = url.replace("sortby=status-desc", "sortby=status-asc");
					} else {
						var arr = url.split("?");
						url = url.replace(arr[1], "sortby=status-desc");
					}
					window.location.assign(url);
				} else {
					window.location.assign("http://localhost:8888/SpringMVC/admin/search-order?sortby=status-desc");
				}
			};
			xhr.send();
		});
	</script>
	

	<script type="text/javascript">
		$("#search-role-img").click(
				function() {
					var txt = $("#search-voucher").val();
					if (txt == "") {
						$("#message-done").removeClass("none");
						$("#content-msg-done").text(
								"You haven't entered search information!");
					} else {
						var url = window.location.href;
						var xhr = new XMLHttpRequest();
						xhr.open("GET", "");
						xhr.onload = function() {
							if (url.includes("?search")) {
								var arr = url.split("?");
								url = url.replace(arr[1], "search=" + txt);
								window.location.assign(url);
							} else {
								window.location.assign("http://localhost:8888/SpringMVC/admin/search-order?search="+ txt);
							}
						};
						xhr.send();
					}
				});
		$('#search-voucher').keyup(
				function(e) {
					if (e.keyCode == 13) {
						var txt = $("#search-voucher").val();
						if (txt == "") {
							$("#message-done").removeClass("none");
							$("#content-msg-done").text(
									"You haven't entered search information!");
						} else {
							var url = window.location.href;
							var xhr = new XMLHttpRequest();
							xhr.open("GET", "");
							xhr.onload = function() {
								if (url.includes("?search")) {
									var arr = url.split("?");
									url = url.replace(arr[1], "search=" + txt);
									window.location.assign(url);
								} else {
									window.location.assign("http://localhost:8888/SpringMVC/admin/search-order?search="+ txt);
								}
							};
							xhr.send();
						}
					}
				});
	</script>

	<script>
		$('.cancel').click(function() {
			$(".message").addClass("none");
			location.reload();
		});
		$('#ok-done').click(function() {
			$("#message-done").addClass("none");
		});
	</script>
	<script>
		$('.btn-confirm-order')
				.click(
						function() {
							$("#msg-old").removeClass("none");
							$("#msg-old .content-msg")
									.text(
											"Are you sure you want to browse this order?");
							var id_order = this.id;
							$('#msg-old .ok')
									.click(
											function() {
												$("#msg-old").addClass("none");
												setTimeout(
														function() {
															$(
																	"#msg-old .msg-done")
																	.removeClass(
																			"importantNone");
														}, 10);
												setTimeout(
														function() {
															$(
																	"#msg-old .msg-done")
																	.addClass(
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
																				+ "/SpringMVC/admin/search-order");
															};
															xhr.send();
														}, 500);
											});
						});
		$('#msg-old .cancel').click(function() {
			$("#msg-old").addClass("none");
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
	<!-- EDIT and VIEW DETAILS ONCLICK-->
	<script>
		$('.editneworder')
				.click(
						function() {
							var id_order = this.id;
							var xhr = new XMLHttpRequest();
							xhr.open("GET", "");
							xhr.onload = function() {
								window.location
										.assign("http://localhost:8888/SpringMVC/admin/order-management/edit-order?id_order="
												+ id_order);
							};
							xhr.send();
						});
		$('.btn-details-order')
				.click(
						function() {
							var id_order = this.id;
							var xhr = new XMLHttpRequest();
							xhr.open("GET", "");
							xhr.onload = function() {
								window.location
										.assign("http://localhost:8888/SpringMVC/admin/order-management/order-details?id_order="
												+ id_order);
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