<!DOCTYPE html>
<html lang="en">
<title>Order :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value="/assets/css/buynow-thank.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/color.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/thank-pay.css"/>">
<link rel="stylesheet"
	href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />">

<style>
.none {
	display: none;
}
</style>
<body>
	<c:if test="${ cartid != null && cartid != 0}">
		<form method="post" action="/SpringMVC/cart/checkout/user-cart/${ cartid }">
	</c:if>
	<c:if test="${ cartid == null || cartid==0 }">
		<form action="/SpringMVC/cart/checkout/ok/${ id }" method="post">
	</c:if>
	
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
			<c:if test="${ userID != null }">
				<div class="avt">
					<img src="<c:url value="/assets/images/users/${ avatar }"/>" alt="">
				</div>
			</c:if>
			<c:if test="${ userID == null }">
				<div class="avt">
					<img src="<c:url value="/assets/images/icons/emiuuu.jpg"/>" alt="">
				</div>
			</c:if>
		</div>
		<div class="checkout">
			<!-- Consignee information -->
			<div class="customer-info">
				<div class="info-customer-left">
					<table class="table-info-customer">
						<tr>
							<th>Buying information</th>
							<th>Delivery address</th>
						</tr>
						<tr>
							<td>${payer.lastName} ${payer.firstName} - ${phone}
								<input type="hidden" name="fullname" value="${payer.lastName} ${payer.firstName}">
								<input type="hidden" name="phone" value="${ phone }">
							</td>
							
							<c:if
								test="${shippingAddress.line2 != null && shippingAddress.line2 != ''}">
								<td>${shippingAddress.line1} ${shippingAddress.line2} -
									${shippingAddress.city} - ${shippingAddress.state}
									<input type="hidden" name="city" value="${shippingAddress.state}">
									<input type="hidden" name="town" value="${shippingAddress.city}">
									<input type="hidden" name="village" value="${shippingAddress.line1} ${shippingAddress.line2}">
								</td>
							</c:if>
							<c:if
								test="${shippingAddress.line2 == null || shippingAddress.line2 == ''}">
								<td>${shippingAddress.line1}-${shippingAddress.city}-${shippingAddress.state}
									<input type="hidden" name="city" value="${shippingAddress.state}">
									<input type="hidden" name="town" value="${shippingAddress.city}">
									<input type="hidden" name="village" value="${shippingAddress.line1}">
								</td>
									
							</c:if>
							
						</tr>
						<tr>
							<td>${ payer.email }
								<input type="hidden" name="email" value="${ payer.email }">
							</td>
						</tr>
						<tr>
							<th>Mode of payment</th>
							<th>Shipping method</th>
						</tr>
						<tr>
							<td>Payment by credit card</td>
							<td>Delivery to your place</td>
						</tr>
						<tr>
							<th colspan="2">Note</th>
						</tr>
						<tr>
							<td colspan="2">${ note }</td>
						</tr>
					</table>
				</div>
				<input type="hidden" name="vccode" value="${ vccode }">
				<input type="hidden" name="method" value="Credit card">
				<div class="continue-shopping">
					<input type="submit" name="paynow" id="paynow" value="Pay now">
				</div>
				
				
			</div>

			<!-- Order -->
			<div class="order">
				<h4>Order information</h4>
				<c:if test="${ csprod != null }">
					<div class="list">
						<c:set var="liCS" value="${ csprod }"></c:set>
							<div class="products-checkout">
								<div class="img-prod">
									<img
										src="<c:url value="/assets/images/products/${ liCS.prod.thumbnail }"/>"
										alt="">
								</div>
								<div class="name-product-checkout">
									<b>${ liCS.prod.title }</b>
									<p>${ liCS.color.color_name } - ${ liCS.size.size_number }</p>
								</div>
								<div class="qty-price">
									<div class="qty">x${ quantity }</div>
									<div class="price-product-checkout">
										<b> $<fmt:formatNumber type="number" maxFractionDigits="2"
												value="${ liCS.prod.price-
										liCS.prod.price * liCS.prod.discount/100 }" /></b>
									</div>
								</div>
							</div>
							<input type="hidden" name="size" value="${ liCS.size.id }">
							<input type="hidden" name="color" value="${ liCS.color.id }">
							<input type="hidden" name="quantity" value="${ quantity }">
							<input type="hidden" name="idprod" value="${ liCS.prod.id }">
					</div>
				</c:if>
				<c:if test="${ csprod == null }">
					<div class="list">
						<c:forEach var="liCS" items="${ listProd }">
							<div class="products-checkout">
								<div class="img-prod">
									<img
										src="<c:url value="/assets/images/products/${ liCS.key.color_size.prod.thumbnail }"/>"
										alt="">
								</div>
								<div class="name-product-checkout">
									<b>${ liCS.key.color_size.prod.title }</b>
									<p>${ liCS.key.color_size.color.color_name } - ${ liCS.key.color_size.size.size_number }</p>
								</div>
								<div class="qty-price">
									<div class="qty">x${ liCS.value }</div>
									<div class="price-product-checkout">
										<b> $<fmt:formatNumber type="number" maxFractionDigits="2"
												value="${ liCS.key.color_size.prod.price-
										liCS.key.color_size.prod.price * liCS.key.color_size.prod.discount/100 }" /></b>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<div class="calculator" style="margin-top: 88px;">
					<table>
						<tr>
							<td class="txt">
								<div class="total-products-cost">Total products cost</div>
							</td>
							<c:if test="${ voucher != null && voucher > 0 }">
								<td class="price"><b> $<fmt:formatNumber type="number"
											maxFractionDigits="2" value="${ total + voucher }" />
								</b></td>
							</c:if>
							<c:if test="${ voucher == null || voucher <= 0 }">
								<td class="price"><b> $<fmt:formatNumber type="number"
											maxFractionDigits="2" value="${ total }" />
								</b></td>
							</c:if>
						</tr>
						<tr>
							<td class="txt">
								<div class="shipping-chargers">Shipping charges</div>
							</td>
							<td class="price"><b>$11.00</b></td>
						</tr>
						<c:if test="${ total >= 50 }">
							<tr>
								<td class="txt">
									<div class="shipping-chargers">Free ship</div>
								</td>

								<td class="price" style="color: #ff6200;"><b>-$11.00</b></td>
							</tr>
						</c:if>

						<c:if test="${ voucher != null && voucher > 0 }">
							<tr>
								<td class="txt">
									<div class="shipping-chargers">Voucher</div>
								</td>
								<td class="price" style="color: #ff6200;"><b>-$<fmt:formatNumber
											type="number" maxFractionDigits="2" value="${ voucher }" /></b></td>
							</tr>
						</c:if>
						<tr>
							<td colspan="2">
								<hr>
							</td>
						</tr>
						<tr>
							<td class="txt">
								<div class="total-payment-calculator">
									<span class="txt-total-payment">Total payment</span>
								</div>
							</td>
							<td class="price"><span class="total-payment"> <b>
										$<fmt:formatNumber type="number" maxFractionDigits="2"
											value="${ total }" />
								</b></span></td>
						</tr>
					</table>
				</div>

			</div>

		</div>
		
		

	</form>

	<script type="text/javascript">
		if (window.performance
				&& window.performance.navigation.type == window.performance.navigation.TYPE_BACK_FORWARD) {
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "");
			xhr.onload = function() {
				window.location.assign("http://localhost:8888/SpringMVC/");
			};
			xhr.send();
		}
	</script>

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


