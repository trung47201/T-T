<!DOCTYPE html>
<html lang="en">
<title>Checkout :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value="/assets/css/checkoutcart.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/color.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/message.css"/>">
<link rel="stylesheet"
	href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />">

<style>
.none {
	display: none;
}

.importantNone {
	display: none !important;
}
input.ok {
    width: 120px;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
.calculator table {
    margin-top: 60px;
}
.products-checkout {
    max-height: 240px;
}
</style>


<body>
	<form action="/SpringMVC/checkout-cart/ok?process=${ process }" method="post">
		<div class="nav">
			<c:set var="item" value="${ back_home }"></c:set>
			<c:if test="${ item == 'home'}">
				<div class="back">
					<a href="/SpringMVC"><img
						src="<c:url value="/assets/images/icons/back52.png"/>"
						alt="back-icon">Back</a>
				</div>
			</c:if>
			<c:if test="${ item == 'cart'}">
				<div class="back">
					<a href="/SpringMVC/cart"><img
						src="<c:url value="/assets/images/icons/back52.png"/>"
						alt="back-icon">Back</a>
				</div>
			</c:if>
			<div class="avt">
				<img src="<c:url value="/assets/images/icons/user100.png"/>" alt="">
			</div>
			<div class="login">
				<div class="container-xl icon-user">
					<button type="button" class="icon-user btn btn-primary"
						data-toggle="modal" data-target="#login">
						<img class="icon-user"
							src="<c:url value="/assets/images/icons/user48.png"/>"
							alt="icon-user">
					</button>
					<div class="modal fade" id="login" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<button type="button" class="btn btn-secondary close"
									data-dismiss="modal">
									<img class="close-login-icon"
										src="<c:url value="/assets/images/icons/close48.png"/>"
										alt="icon-close" width="32px">
								</button>
								<div class="login_form_container">
									<div class="login_form">
										<h2>Login</h2>
										<div class="input_group">
											<i class="fa fa-user"></i> <input type="text"
												placeholder="Username" class="input_text" autocomplete="off" />
										</div>
										<div class="input_group">
											<i class="fa fa-unlock-alt"></i> <input type="password"
												placeholder="Password" class="input_text" autocomplete="off" />
										</div>
										<div class="button_group" id="login_button">
											<a>Login</a>
										</div>
										<div class="fotter">
											<a>Forgot Password ?</a> <a>SingUp</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="checkout">
			<!-- Consignee information -->
			<div class="customer-info">
				<h4>Consignee information</h4>
				<div class="name-customer">
					<input type="text" id="fullname" name="fullname"
						value="" placeholder="Full name">
				</div>
				<div class="phone-customer">
					<input type="number" id="phone" name="phone"
						value="" placeholder="Phone number" min="0">
				</div>
				<div class="mail-customer">
					<input type="text" id="email" name="email" value=""
						placeholder="Email">
				</div>
				<div class="city-customer">
					<input type="text" id="city" name="city" value=""
						placeholder="City">
				</div>
				<div class="town-customer">
					<input type="text" id="town" name="town" value=""
						placeholder="Town">
				</div>
				<div class="village-customer">
					<input type="text" id="village" name="village" value=""
						placeholder="Village">
				</div>
				<div class="note-customer">
					<textarea id="note" name="note" placeholder="Note"></textarea>
				</div>
			</div>

			<!-- Payment methods -->
			<div class="payment-method">
				<h4>Shipping methods</h4>
				<div class="shipping" id="radio1" onclick="radio(this)">
					<input type="radio" name="Delivery" id="rad1" checked>
					<div>&emsp;Delivery to your place</div>
					<div>&emsp;&emsp;&emsp;$11.00</div>

				</div>
				<div class="content-sm" id="content-sm">Buy products over $50
					will get free shipping</div>

				<h4 class="pm">Payment methods</h4>
				<div class="shipping" id="radio2" onclick="radio(this)">
					<input type="radio" name="paymentmethods" id="rad2" value="cod"
						checked>
					<div class="icon-cod">
						&emsp;Payment on delivery (COD) <img
							src="<c:url value="/assets/images/icons/cash-on-delivery.png"/>"
							alt="">
					</div>
				</div>
				<div class="content-pm" id="content-pm">You only have to pay
					when you receive the goods.</div>
			</div>

			<!-- Order -->
			<div class="order">
				<input type="hidden" name="id_prod" id="id_prod"
					value="${ prod_checkout.id }">
				<h4>Order information</h4>
				<div class="products-checkout">
					<c:forEach var="it" items="${ listCart }">
						<div class="list_prod_checkout">
							<div class="img-product-checkout">
								<img
									src="<c:url value="/assets/images/products/${ it.key.prod.thumbnail }"/>"
									alt="">
							</div>
							<table>
								<tr>
									<th colspan="2">${ it.key.prod.title }</th>
								</tr>
								<tr>
									<td colspan="2">${ it.key.color.color_name }-${ it.key.size.size_number }</td>
								</tr>
								<tr>
									<c:if test="${ it.key.prod.discount > 0 }">
										<th class="price"><b> $<fmt:formatNumber type="number"
													maxFractionDigits="2"
													value="${ it.key.prod.price - it.key.prod.price * it.key.prod.discount/100 }" />
										</b></th>
									</c:if>
									<c:if test="${ it.key.prod.discount <= 0 }">
										<th class="price"><b> $<fmt:formatNumber type="number"
													maxFractionDigits="2" value="${ it.key.prod.price }" />
										</b></th>
									</c:if>
									<td class="amount"><i>x${it.value }</i></td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</div>

				<div class="calculator">
					<table>
						<tr>
							<td class="txt">
								<div class="total-products-cost">Total products cost</div>
							</td>
							<td class="price"><b>$<fmt:formatNumber type="number"
										maxFractionDigits="2" value="${ totalPayment }" /></b></td>
						</tr>
						<tr>
							<td class="txt">
								<div class="shipping-chargers">Shipping charges</div>
							</td>
							<td class="price"><b>$11.00</b></td>
						</tr>
						<c:if test="${ totalPayment >= 50.0 }">
							<tr>
								<td class="txt">
									<div class="shipping-chargers">Free ship</div>
								</td>
								<td class="price-free"><b>-$11.00</b></td>
							</tr>
						</c:if>
						<tr>
							<td colspan="2">
								<hr>
							</td>
						</tr>
						<c:if test="${ totalPayment >= 50.0 }">
							<c:set var="fee" value="${ 0 }"></c:set>
						</c:if>
						<c:if test="${ totalPayment < 50.0 }">
							<c:set var="fee" value="${ 11.0 }"></c:set>
						</c:if>
						<tr>
							<td class="txt">
								<div class="total-payment-calculator">
									<span class="txt-total-payment">Total payment</span>
								</div>
							</td>
							<td class="price"><span class="total-payment"> <b>$<fmt:formatNumber
											type="number" maxFractionDigits="2"
											value="${ totalPayment + fee }" />
								</b>
							</span></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
		<div class="btn-order">
			<input type="button" name="order" id="order" value="Order">
		</div>
	</form>

	<div class="message msg-order message-notify none" id="message-notify">
		<h2 class="msg-h2">
			Message <img alt=""
				src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
		</h2>
		<p class="content-msg content-msg-notify"></p>
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

	<div class="wrapper importantNone" id="wrapper">
		<div class="message message-notify none" id="message-notify">
			<h2 class="msg-h2">
				Message <img alt=""
					src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
			</h2>
			<p class="content-msg" id="content-msg-notify"></p>
			<div class="btn-ok-cancel">
				<input class="ok hover-btn" id="ok-voucher" type="button" value="OK">
			</div>
		</div>
	</div>

	<script>
		var a = document.getElementById("rad2");
		if (a.checked == true) {
			document.getElementById("content-pm").style.visibility = "visible";
			document.getElementById("radio3").style.marginTop = "30px";
		}
		function bank(x) {
			alert(x.id);
		}
	</script>

	<script>
		function radio(x) {
			for (let i = 1; i < 4; i++) {
				if (x.id == ("radio" + i)) {
					document.getElementById("rad" + i).checked = true;
				}
			}
			if (x.id == "radio2") {
				document.getElementById("content-pm").style.visibility = "visible";
				document.getElementById("content-bank").style.visibility = "hidden";
				document.getElementById("radio3").style.marginTop = "30px";
			} else if (x.id == "radio3") {
				document.getElementById("content-pm").style.visibility = "hidden";
				document.getElementById("content-bank").style.visibility = "visible";
				document.getElementById("radio3").style.marginTop = "-40px";
			}
		}
	</script>

	<script>
		function amount(x) {
			for (let i = 1; i <= 10; i++) {
				if (x.id == ("plus" + i)) {
					var input_txt = document.getElementById("input_Id" + i).value;
					let a = parseInt(input_txt) + 1;
					document.getElementById("input_Id" + i).value = a;
				} else if (x.id == ("minus" + i)) {
					var input_txt = document.getElementById("input_Id" + i).value;
					if (parseInt(input_txt) > 1) {
						let a = parseInt(input_txt) - 1;
						document.getElementById("input_Id" + i).value = a;
					}
				}
			}
		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<script type="text/javascript">
		$("#ok-done").click(function() {
			$("#message-done").addClass("none");
		});
		$("#ok-voucher").click(function() {
			$("#wrapper #message-notify").addClass("none");
		});
		$("#cancel").click(function() {
			$("#message-notify").addClass("none");
		});
	</script>
	<script type="text/javascript">
		const validateEmail = (email) => {
		  	return email.match(
		    	/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
		  	);
		};
		$("#order").click(function() {
			var get = $(this);
			var fullname = $("#fullname").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var city = $("#city").val();
			var town = $("#town").val();
			var village = $("#village").val();
			
			var error = "";
			if(fullname == "") {
				error = "Full name is empty!";
			} else if(phone == "") {
				error = "Phone number is empty!";
			} else if(email == "") {
				error = "Email address is empty!";
			} else if(!validateEmail(email)) {
				error = "Invalid email format!";
			} else if(city == "") {
				error = "City is empty!";
			} else if(town == "") {
				error = "Town is empty!";
			} else if(village == "") {
				error = "Village is empty!";
			}
			if (error == "") {
				$(get).attr("type", "submit");
			} else {
				$("#wrapper").removeClass("importantNone");
				$("#wrapper #message-notify").removeClass("none");
				$("#wrapper #content-msg-notify").text(error);
			}
		});
	</script>
	
	<script type="text/javascript">
	if (window.performance && window.performance.navigation.type == window.performance.navigation.TYPE_BACK_FORWARD) {
		window.location.href="http://localhost:8888/SpringMVC/";
	}
	if(performance.navigation.type == 2)
	{
		window.location.href="http://localhost:8888/SpringMVC/";
	}
	</script>
	
	<script src="<c:url value="/assets/js/color.js" />" defer></script>
	<script src="js/login.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>

</html>