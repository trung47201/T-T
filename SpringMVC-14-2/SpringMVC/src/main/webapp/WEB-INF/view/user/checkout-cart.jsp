<!DOCTYPE html>
<html lang="en">
<title>Checkout :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet"
	href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />">

<body>
	<form action="" method="post">
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

					<c:if test="${ value_name != 'null' }">
						<input type="text" id="fullname" name="fullname"
							value="${ value_name }" placeholder="Full name">
					</c:if>
					<c:if test="${ value_name == 'null' }">
						<input type="text" id="fullname" name="fullname" value=""
							placeholder="Full name">
					</c:if>
				</div>
				<c:set var="fullname_error" value="${ fullname }"></c:set>
				<p class="error-name">${ fullname_error }</p>

				<div class="phone-customer">
					<c:set var="_phone" value="${ value_phone }"></c:set>
					<c:if test="${ _phone != 'null' }">
						<input type="text" id="phone" name="phone" value="${ _phone }"
							placeholder="Phone number">
					</c:if>
					<c:if test="${ _phone == 'null' }">
						<input type="text" id="phone" name="phone" value=""
							placeholder="Phone number">
					</c:if>
				</div>
				<c:set var="phone_error" value="${ phone }"></c:set>
				<p class="error-name">${ phone_error }</p>

				<c:if test="${ value_phone != 'null' }">
					<p class="error-name">${ phone_ }</p>
				</c:if>

				<div class="mail-customer">
					<c:set var="_email" value="${ value_email }"></c:set>
					<c:if test="${ _email != 'null' }">
						<input type="text" id="email" name="email" value="${ _email }"
							placeholder="Email">
					</c:if>
					<c:if test="${ _email == 'null' }">
						<input type="text" id="email" name="email" value=""
							placeholder="Email">
					</c:if>
				</div>
				<c:set var="email_error" value="${ email }"></c:set>
				<p class="error-name">${ email_error }</p>

				<c:if test="${ _email != 'null' }">
					<p class="error-name">${ email_ }</p>
				</c:if>
				<div class="city-customer">
					<c:set var="_city" value="${ value_city }"></c:set>
					<c:if test="${ _city != 'null' }">
						<input type="text" id="city" name="city" value="${ value_city }"
							placeholder="City">
					</c:if>
					<c:if test="${ _city == 'null' }">
						<input type="text" id="city" name="city" value=""
							placeholder="City">
					</c:if>
				</div>
				<c:set var="city_error" value="${ city }"></c:set>
				<p class="error-name">${ city_error }</p>

				<div class="town-customer">
					<c:set var="_town" value="${ value_town }"></c:set>
					<c:if test="${ _town != 'null' }">
						<input type="text" id="town" name="town" value="${ value_town }"
							placeholder="Town">
					</c:if>
					<c:if test="${ _town == 'null' }">
						<input type="text" id="town" name="town" value=""
							placeholder="Town">
					</c:if>
				</div>
				<c:set var="town_error" value="${ town }"></c:set>
				<p class="error-name">${ town_error }</p>

				<div class="village-customer">
					<c:set var="_village" value="${ value_village }"></c:set>
					<c:if test="${ _village != 'null' }">
						<input type="text" id="village" name="village"
							value="${ value_village }" placeholder="Village">
					</c:if>
					<c:if test="${ _village == 'null' }">
						<input type="text" id="village" name="village"
							placeholder="Village">
					</c:if>
				</div>
				<c:set var="village_error" value="${ village }"></c:set>
				<p class="error-name">${ village_error }</p>

				<div class="note-customer">
					<c:set var="_note" value="${ value_note }"></c:set>
					<c:if test="${ _note != 'null' }">
						<textarea id="note" name="note" placeholder="Note">${ value_note }</textarea>
					</c:if>
					<c:if test="${ _note == 'null' }">
						<textarea id="note" name="note" placeholder="Note"></textarea>
					</c:if>
				</div>
				<c:set var="note_error" value="${ note }"></c:set>
				<p class="error-name">${ note_error }</p>
			</div>

			<!-- Payment methods -->
			<div class="payment-method">
				<h4>Shipping methods</h4>
				<div class="shipping" id="radio1" onclick="radio(this)">
					<input type="radio" name="Delivery" id="rad1" checked>
					<div>&emsp;Delivery to your place</div>
					<div>&emsp;&emsp;&emsp;$11.00</div>
					
				</div>
				<div class="content-sm" id="content-sm">Buy products over $50 will get free shipping</div>
					
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
				<div class="shipping" id="radio3" onclick="radio(this)">
					<input type="radio" name="paymentmethods" id="rad3"
						value="payByCard">
					<div class="icon-credit">
						&emsp; Pay by credit card <img
							src="<c:url value="/assets/images/icons/credit-card.png"/>"
							alt="">
					</div>
				</div>
				<div class="content-bank" id="content-bank">
					<div>Choose a bank</div>
					<div class="bank">
						<div class="bank" id="visa" onclick="bank(this)">
							<img src="<c:url value="/assets/images/icons/visa.png"/>" alt="">
						</div>
						<div class="bank" id="mastercard" onclick="bank(this)">
							<img src="<c:url value="/assets/images/icons/mc-logo.png"/>"
								alt="">
						</div>
						<div class="bank" id="amex" onclick="bank(this)">
							<img src="<c:url value="/assets/images/icons/amex.png"/>" alt="">
						</div>
						<div class="bank" id="discover" onclick="bank(this)">
							<img src="<c:url value="/assets/images/icons/discover.jpg"/>"
								alt="">
						</div>
						<div class="bank" id="maestro" onclick="bank(this)">
							<img src="<c:url value="/assets/images/icons/maestro.png"/>"
								alt="">
						</div>
					</div>
				</div>
			</div>

			<!-- Order -->
			<div class="order">

				<input type="hidden" name="id_prod" id="id_prod"
					value="${ prod_checkout.id }">
				<h4>Order information</h4>

				<div class="products-checkout">
					<c:forEach var="prod_checkout" items="${ listProd }">
						<c:forEach var="color_checkout" items="${ listColor }">
							<c:if test="${ color_checkout.key == prod_checkout.id}">
								<c:forEach var="size_checkout" items="${ listSize }">
									<c:if test="${ size_checkout.key == prod_checkout.id}">
										<c:forEach var="amount_checkout" items="${ listAmount }">
											<c:if test="${ amount_checkout.key == prod_checkout.id}">
												<div class="list_prod_checkout">
													<div class="img-product-checkout">
														<img
															src="<c:url value="/assets/images/products/${ prod_checkout.thumbnail }"/>"
															alt="">
													</div>
													<table>
														<tr>
															<th colspan="2">${ prod_checkout.title }</th>
														</tr>
														<tr>
															<td colspan="2">${ color_checkout.value.color_name }-${ size_checkout.value.size_number }</td>
														</tr>
														<tr>
															<c:if test="${ prod_checkout.discount > 0 }">
																<th class="price">
																	<b>
																		$<fmt:formatNumber type="number" maxFractionDigits="2"
																		value="${ prod_checkout.price - prod_checkout.price * prod_checkout.discount/100 }" />
																	</b>
																</th>
															</c:if>
															<c:if test="${ prod_checkout.discount <= 0 }">
																<th class="price">
																	<b>
																		$<fmt:formatNumber type="number" maxFractionDigits="2"
																		value="${ prod_checkout.price }" />
																	</b>
																</th>
															</c:if>
															<td class="amount"><i>x${amount_checkout.value }</i></td>
														</tr>
													</table>
												</div>
											</c:if>
										</c:forEach>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>


				<div class="voucher">
					<div class="input-voucher">
						<input type="text" name="voucher_code" id="voucher_code" placeholder="Voucher">
					</div>
					<div class="apply-voucher">
						<input type="button" onclick="apply(this);" name="applyvoucher" id="applyvouchers" value="Apply" >
					</div>
				</div>
				<hr>
				<div class="calculator">
					<table>
						<tr>
							<td class="txt">
								<div class="total-products-cost">Total products cost</div>
							</td>
							<td class="price"><b>$<fmt:formatNumber type="number" maxFractionDigits="2"
												value="${ totalPayment }" /></b></td>
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
									<div class="shipping-chargers">Voucher free ship</div>
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
							<td class="price">
								<span class="total-payment">
									<b>$<fmt:formatNumber type="number" maxFractionDigits="2"
										value="${ totalPayment + fee }" />
									</b>
								</span>
							</td>
						</tr>
					</table>
				</div>

			</div>
		</div>
		<div class="btn-order">
			<input type="submit" name="order" id="order" value="Order">
		</div>
	</form>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script type="text/javascript">
function apply (x) {
	var voucher = document.getElementById("voucher_code").value;
	var urlCurrent = window.location.href;
	var xhr = new XMLHttpRequest();
  	xhr.open("GET", urlCurrent+"&voucher="+voucher);
  	// What to do when server responds
  	xhr.onload = function () { 
  		window.location.assign(urlCurrent+"&voucher="+voucher) 
  	};
  	xhr.send();
  	// (C) PREVENT HTML FORM SUBMIT
  	return false;	
}
</script>
	<script type="text/javascript">
	    function ajaxget (x) {	    		    	
	      	var xhr = new XMLHttpRequest();	      	
	      	xhr.open("GET", "http://localhost:8888/SpringMVC/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod="+${prod_checkout.id}+"&id_color=" + x.id);
	      	// What to do when server responds
	      	xhr.onload = function () { 
	      		window.location.assign("http://localhost:8888/SpringMVC/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod="+${prod_checkout.id}+"&id_color=" + x.id) 
	      	};
	      	xhr.send();	
	      	// (C) PREVENT HTML FORM SUBMIT
	      	return false;	
	    }
		function size (x) {	    		    	
	      	var xhr = new XMLHttpRequest();
	      	xhr.open("GET", "http://localhost:8888/SpringMVC/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod="+${prod_checkout.id}+"&id_color="+${color_id}+"&id_size=" + x.id);
	      	// What to do when server responds
	      	xhr.onload = function () { 
	      		window.location.assign("http://localhost:8888/SpringMVC/cart/checkout?177627f91af678a9b03e993f1a91917f&id_prod="+${prod_checkout.id}+"&id_color="+${color_id}+"&id_size=" + x.id) 
	      	};
	      	xhr.send();
	      	// (C) PREVENT HTML FORM SUBMIT
	      	return false;	
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