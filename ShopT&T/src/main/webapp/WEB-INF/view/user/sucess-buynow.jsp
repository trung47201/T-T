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
<link rel="stylesheet"
	href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />">

<style>
.none {
display: none;
}
</style>
<body>
	<form>
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
		    
		    <c:if test="${ userID == null }">
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
		    </c:if>
		</div>
		<div class="checkout">
			<!-- Consignee information -->
			<div class="customer-info">
				<div class="thank-you">
					<img src="<c:url value="/assets/images/icons/icons8-ok-100.png"/>"
						alt="">
					<div class="content-thank">
						<h3>Thank you for your order!</h3>
						<p>We will contact your phone number to confirm, please pay
							attention to the call.</p>
					</div>
				</div>
				<div class="info-customer-left">
					<table class="table-info-customer">
						<tr>
							<th>Buying information</th>
							<th>Delivery address</th>
						</tr>
						<tr>
							<td>${ fullname }-${ phone_number }</td>
							<td>${ city }-${ town }-${ village }</td>
						</tr>
						<tr>
							<td>${ email }</td>

						</tr>
						<tr>
							<th>Mode of payment</th>
							<th>Shipping method</th>
						</tr>
						<tr>
							<c:if test="${ method == 'COD' }">
								<td>Payment on delivery (COD)</td>
							</c:if>
							<c:if test="${ method == 'Credit card'}">
								<td>Payment by Credit card</td>
							</c:if>
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
				<c:if test="${ userID != null }">
					<div class="continue-shopping">
						<a href="/SpringMVC/products/${ userID }"><input type="button"
							name="continueShopping" id="continueShopping"
							value="Continue Shopping"></a>
					</div>
				</c:if>
				<c:if test="${ userID == null }">
					<div class="continue-shopping">
						<a href="/SpringMVC/products"><input type="button"
							name="continueShopping" id="continueShopping"
							value="Continue Shopping"></a>
					</div>
				</c:if>
			</div>

			<!-- Order -->
			<div class="order">
				<h4>Order information</h4>
				<div style="width: 84%; margin-left: 7%; margin-top: 30px;">
					<div class="products-checkout">
						<img
							src="<c:url value="/assets/images/products/${ product.thumbnail }"/>"
							alt="">
						<div class="name-product-checkout">${ product.title }</div>
						<div class="price-product-checkout">
							$
							<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${ product.price-
							product.price*product.discount/100 }" />
						</div>
					</div>
				</div>
				<div class="request-checkout">
					<table>
						<tr>
							<td class="txt">
								<div class="total-products-cost">Color</div>
							</td>
							<td class="price"><span class="color-span"
								style="background: ${ color };"></span></td>
						</tr>
						<tr>
							<td class="txt">
								<div class="shipping-chargers">Size</div>
							</td>
							<td class="price"><b>${ size }</b></td>
						</tr>
						<tr>
							<td class="txt">
								<div class="shipping-chargers">Quantity</div>
							</td>
							<td class="price"><b>${ quantity }</b></td>
						</tr>
					</table>
				</div>

				<hr>
				<div class="calculator" style="margin-top: 88px;">
					<table>
						<tr>
							<td class="txt">
								<div class="total-products-cost">Total products cost</div>
							</td>

							<c:if test="${ product.discount <=0 }">
								<td class="price"><b> $<fmt:formatNumber type="number"
											maxFractionDigits="2" value="${ product.price*quantity }" />
								</b></td>
							</c:if>
							<c:if test="${ product.discount > 0 }">
								<td class="price"><b> $<fmt:formatNumber type="number"
											maxFractionDigits="2"
											value="${ product.price*quantity -
										product.price*quantity*product.discount/100 }" />
								</b></td>
							</c:if>
						</tr>
						<tr>
							<td class="txt">
								<div class="shipping-chargers">Shipping charges</div>
							</td>
							<td class="price"><b>$11.00</b></td>
						</tr>
						<c:if test="${ product.discount <= 0 }">
							<c:if test="${ product.price*quantity >= 50 }">
								<tr>
									<td class="txt">
										<div class="shipping-chargers">Free ship</div>
									</td>

									<td class="price" style="color: #ff6200;"><b>-$11.00</b></td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${ product.discount > 0 }">
							<c:if
								test="${ product.price*quantity - product.price*quantity*product.discount/100 >= 50 }">
								<tr>
									<td class="txt">
										<div class="shipping-chargers">Free ship</div>
									</td>

									<td class="price" style="color: #ff6200;"><b>-$11.00</b></td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${ discount != null && discount > 0 }">
							<tr>
								<td class="txt">
									<div class="shipping-chargers">Voucher</div>
								</td>
								<td class="price" style="color: #ff6200;"><b>-$<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${ discount }" /></b></td>
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

							<c:if test="${ price_at != null }">
								<td class="price"><span class="total-payment"> <b>
											$<fmt:formatNumber type="number" maxFractionDigits="2"
												value="${price_at }" />
									</b></span></td>
							</c:if>
							<c:if test="${ price_at == null }">
								<c:if test="${ product.discount <=0 }">
									<c:if test="${ product.price*quantity >= 50 }">
										<td class="price"><span class="total-payment"><b>$${
													product.price*quantity }</b></span></td>
									</c:if>
									<c:if test="${ product.price*quantity < 50 }">
										<td class="price"><span class="total-payment"><b>$${
													product.price*quantity +11.0}</b></span></td>
									</c:if>
								</c:if>
								<c:if test="${ product.discount > 0 }">
									<c:if
										test="${ (product.price*quantity - product.price*quantity*product.discount/100) < 50 }">
										<td class="price"><span class="total-payment"> <b>$${
													product.price*quantity -
													product.price*quantity*product.discount/100 + 11.00}</b></span></td>
									</c:if>
									<c:if
										test="${ (product.price*quantity - product.price*quantity*product.discount/100) >= 50 }">
										<td class="price"><span class="total-payment"> <b>$${
													product.price*quantity -
													product.price*quantity*product.discount/100}</b></span></td>
									</c:if>
								</c:if>
							</c:if>
						</tr>
					</table>
				</div>

			</div>

		</div>

	</form>
	
	<script type="text/javascript">
	if (window.performance && window.performance.navigation.type == window.performance.navigation.TYPE_BACK_FORWARD) {
		window.location.href="http://localhost:8888/SpringMVC/";
	}
	if(performance.navigation.type == 2)
	{
		window.location.href="http://localhost:8888/SpringMVC/";
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