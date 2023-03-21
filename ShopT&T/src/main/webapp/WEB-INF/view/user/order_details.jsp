<!DOCTYPE html>
<html lang="en">
<title>Thank you! :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href='<c:url value="/assets/css/bootstrap.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/js/bootstrap.js"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/index.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/login-icon.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/bootstrap.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/js/bootstrap.min.js"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/login.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/swiper-bundle.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/products_c.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/add-to-cart.css"/>'>
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/order_details.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/navscroll.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/message.css"/>">
<style>
.hr-bg-half {
	background: linear-gradient(to right, blue 50%, gray 50%) !important;
}

.hr-bg-process {
	background: gray !important;
}

.strike-dot {
	margin: 16.5px 0px !important;
}

.ok-btn button {
	border: 1px solid;
	background: #0086ff;
	color: white;
	font-size: 20px;
	box-shadow: 0 0 5px #666;
}

.welcome {
	box-shadow: 0px 5px 15px;
}
.title-page {
    margin-top: 20px !important;
}
.continue-cancel a:hover {
    text-shadow: 0 0 2px white;
    color: #0086ff;
    cursor: pointer !important;
}
.continue-cancel a {
    color: #00ccff;
}
.continue-cancel {
    display: flex;
    justify-content: space-between;
    width: 84%;
    margin-left: 8%;
    padding-bottom: 10px;
}
.message {
	top: 32% !important;
}
</style>
<body style="color: white;">
	<header class="container-xl header-content">
		<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
		<form method="post">
			<div class="title-page">
				<h3>ORDER DETAILS</h3>
				<span><a href="/SpringMVC/">Home</a> / <a href="">Order
						details</a></span>
			</div>
			<!-- ######################################################################################################################################### -->
			<div class="order">

				<div class="list-order">
					<div class="thanks-for-order">
						<h4>
							Thanks for your Order, <span>${ nameUser }</span>!
						</h4>
						<div>

							<p>
								<b>${ order.address }</b>
							</p>
							<p>
								<b>${ order.phone_number }</b>
							</p>
						</div>
					</div>
					<div class="order-form">
						<div class="order-form-hearder">
							<div class="order-code">
								<h5>
									INVOICE <span>#${ order.bill }</span>
								</h5>
							</div>
							<div class="order-infor">
								<div class="">
									<p>
										Order Date <b>${ order.order_date }</b>
									</p>
									<p>
										Expected Arrival <b>2023-12-01</b>
									</p>
									<p>
										VNPost <b>CW763479047VN</b>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="track-order">
						<div class="track-order-form">
							<div class="order-form-status">
								<c:if test="${ status != null && status == 1 }">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
									<hr class="strike-dot hr-bg-process">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
									<hr class="strike-dot hr-bg-process">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
									<hr class="strike-dot hr-bg-process">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
								</c:if>
								<c:if test="${ status != null && status == 2 }">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot hr-bg-half">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
									<hr class="strike-dot hr-bg-process">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
									<hr class="strike-dot hr-bg-process">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
								</c:if>
								<c:if test="${ status != null && status == 3 }">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot hr-bg-half">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
									<hr class="strike-dot hr-bg-process">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
								</c:if>
								<c:if test="${ status != null && status == 4 }">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot hr-bg-half">
									<div class="dot">
										<span class="hr-bg-process"><span
											class="being  hr-bg-process"></span></span>
									</div>
								</c:if>
								<c:if test="${ status != null && status == 5 }">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
									<hr class="strike-dot">
									<div class="dot">
										<span><img
											src="<c:url value="/assets/images/icons/icons8-checkmark-64.png"/>"
											alt=""></span>
									</div>
								</c:if>
							</div>
							<div class="order-form-status-text">
								<div class="dot">PROCESSED</div>
								<div class="dot">PACKED</div>
								<div class="dot">SHIPPED</div>
								<div class="dot">DELIVERED</div>
							</div>
						</div>
					</div>
					<c:forEach var="liOrder_details" items="${ listOrder_details }">
						<div class="order-list-product">
							<div class="product-ele">
								<div class="img">
									<img
										src="<c:url value="/assets/images/products/${ liOrder_details.prod.thumbnail }"/>"
										alt="">
								</div>
								<div class="title">
									<div class="form-prod-col2">
										<h5>${ liOrder_details.prod.title }</h5>

										<p>${ liOrder_details.color.color_name }-${ liOrder_details.size.size_number }</p>
									</div>
									<div class="form-prod-col3">
										<div class="row2">
											<p>x${ liOrder_details.quantity }</p>

										</div>
										<p class="p-price">
											$<fmt:formatNumber type="number" maxFractionDigits="2"
												value="${ liOrder_details.price_at }" />
										</p>
									</div>

								</div>
							</div>
						</div>
					</c:forEach>

					<div class="prod_details">
						<div class="total-prod">
							<p>Subtotal:</p>
							<p class="money">$${ totalPaid }</p>
						</div>
						<div class="total-prod">
							<p>Shipping charges:</p>
							<p class="money">$11.00</p>
						</div>
						<c:if test="${ total >= 50 }">
							<div class="total-prod">
								<p>Free:</p>
								<p class="money">-$11.00</p>
							</div>
						</c:if>
						<c:if test="${ order.discount_at > 0 }">
							<div class="total-prod">
								<p>Voucher:</p>
								<p class="money">-$${ order.discount_at }</p>
							</div>
						</c:if>


					</div>
					<c:if test="${ total >= 50 }">
						<div class="total">
							<p>TOTAL PAID:</p>
							<span>$<fmt:formatNumber type="number"
									maxFractionDigits="2" value="${ totalPaid - order.discount_at }" /></span>
						</div>
					</c:if>
					<c:if test="${ total < 50 }">
						<div class="total">
							<p>TOTAL PAID:</p>
							<span>$<fmt:formatNumber type="number"
									maxFractionDigits="2" value="${ totalPaid - order.discount_at + 11.0 }" /></span>
						</div>
					</c:if>
					
				</div>
			</div>
			<div class="continue-cancel">
				<a href="/SpringMVC/products/${ userid }"><i class="fa fa-angle-left"></i> Continue Shopping</a>	
				<a class="countermand" id="${ order.id }">Countermand <i class="fa fa-angle-right"></i></a>			
			</div>
		</form>
	</header>
	
	<div class="message msg-order none" id="message-notify">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg">Are you sure you want to <b>countermand</b> this order?</p>
		<div class="btn-ok-cancel">
			<input class="cancel" id="cancel" type="button" value="No">
			<input class="ok" id="ok-notify" type="button" value="Yes">
		</div>
	</div>
	
	<div class="message msg-order none" id="message-done">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg" id="msg-done"></p>
		<div class="btn-ok-cancel">
			<input class="ok" id="ok-done" type="button" value="OK">
		</div>
	</div>
	
	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>

	<jsp:include page="../layouts/user/search.jsp"></jsp:include>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>


	<script type="text/javascript">
		var order_id = "${ order.id }";
		$(".countermand").click(function() {
			$("#message-notify").removeClass("none");
			$("#message-notify #ok-notify").click(function() {
				$("#message-notify").addClass("none");
				$("#message-done").removeClass("none");
				if(${ order.status.id == 1 }) {
					$("#msg-done").text("Success countermand!!!");
					var xhr = new XMLHttpRequest();
					xhr.open("GET",
							"http://localhost:8888/SpringMVC/order/countermand/"+order_id);
					xhr.onload = function() {
						//window.location.assign("http://localhost:8888/SpringMVC/");
					};
					xhr.send();
				} else {
					$("#msg-done").text("Please wait for confirmation!!!");
					var xhr = new XMLHttpRequest();
					xhr.open("GET",
							"http://localhost:8888/SpringMVC/order/countermand/"+order_id);
					xhr.onload = function() {
						//window.location.assign("http://localhost:8888/SpringMVC/");
					};
					xhr.send();
				}
			});
		});
	</script>


	<script type="text/javascript">
		$(".cancel").click(function() {
			$(".message").addClass("none");
			location.reload();
		});
		$("#ok-done").click(function() {
			$(".message").addClass("none");
			location.reload();
		});
	</script>


	<script type="text/javascript">
	$(document).ready(function(){
		 $(".form-check-input").click(function(){
			 var rememberme = this.checked;
			  var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/home?rememberme="+rememberme);
				// What to do when server responds
				xhr.onload = function() {
					//window.location.assign("http://localhost:8888/SpringMVC/");
				};
				xhr.send();
		  });
		  
	});
	</script>
	<script>
	
	function logout() {
		$(document).ready(function(){
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"http://localhost:8888/SpringMVC/home?logout=true");
			// What to do when server responds
			xhr.onload = function() {
				window.location.assign("http://localhost:8888/SpringMVC/");
			};
			xhr.send();
		});
	}
	</script>
	<script>
		$(document).ready(function(){
		  $(".dropdown-toggle").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		  $(".dropdown-item").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		  $(".img-dropdown-menu").click(function(){
			  $(".img-dropdown-menu").toggleClass("none");
		  });
		});
	</script>
	<script>
		if(${userID == null }) {
			$(document).ready(function() {
				if(${message != "logout"}) {
					$('#login').modal('toggle');
				}
			});
		}
	</script>
	<script type="text/javascript">
	
	if(${ message != null }) {
		if(${message == "true"}) {
			alert("Welcome to Ti Shoes!");
		} else if(${message == "false"}){
			alert("Login unsuccess!");
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
		} else if(${message == "logout"}) {
			alert("Looking forward to seeing you again soon!");
		} else if(${message == "block"}){
			alert("Your account has been locked, please contact hotline: 0346 643 755 for more details!");
			$(document).ready(function() {
				$('#login').modal('toggle');
			});			
		}
	}
		function login() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			if (username=="" || password=="") {
				alert("Username or password is empty");
			} else {
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/home?username="
								+ username +"&password="+password);
				// What to do when server responds
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/");
				};
				xhr.send();
			}
			
		}
		
	</script>
	<script>
		function test($a) {
			for (let i = 1; i <= 10; i++) {
				if (i == $a) {
					var span_Text = document.getElementById("span_Id" + $a).innerText;
					document.querySelector('input[name="search"]').value = span_Text;
				}
			}
		}
	</script>

	<script type="text/javascript">
		window.addEventListener("scroll", function() {
			var div = document.getElementById('nav-search');
			var div1 = document.getElementsByClassName('hidden-poster2');
			if (window.scrollY > 80) {
				div.style.visibility = 'visible';
			} else {
				div.style.visibility = 'hidden';
			}
			if (window.scrollY > 2280 && window.scrollY < 2380) {
				div1.style.visibility = 'hidden';
			} else {
				div1.style.visibility = 'visible';
			}
		})
	</script>

	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"/>"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"/>"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="<c:url value="js/login.js"/>"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"/>"></script>
	<script
		src="<c:url value="https://kit.fontawesome.com/a076d05399.js"/>"></script>

</body>

</html>