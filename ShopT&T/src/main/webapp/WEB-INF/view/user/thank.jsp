<!DOCTYPE html>
<html lang="en">
<title>Order :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value="/assets/css/checkoutcart.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/thank.css"/>">
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
			<c:if test="${ avatar != null }">
				<div class="avt">
					<img src="<c:url value="/assets/images/users/${ avatar }"/>" alt="">
				</div>
			</c:if>
			<c:if test="${ avatar == null }">
				<div class="avt">
					<img src="<c:url value="/assets/images/users/avt-default.jpg"/>" alt="">
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
							<td rowspan="2">${ address }</td>
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
							<c:if test="${ method == 'Credit card' }">
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
				<c:if test="${ userid != null }">
					<div class="continue-shopping">
						<a href="/SpringMVC/products/${ userid }"><input type="button"
							name="continueShopping" id="continueShopping"
							value="Continue Shopping"></a>
					</div>
				</c:if>
				<c:if test="${ userid == null }">
					<div class="continue-shopping">
						<a href="/SpringMVC/products"><input type="button"
							name="continueShopping" id="continueShopping"
							value="Continue Shopping"></a>
					</div>
				</c:if>
			</div>

			<c:if test="${ listOrder != null }">
				<!-- Order -->
				<div class="order">
					<h4>Order information</h4>
					<div class="products-checkout">
						<c:forEach var="order_details" items="${ listOrder }">
							<div class="list_prod_checkout">
								<div class="img-product-checkout">
									<img
										src="<c:url value="/assets/images/products/${ order_details.prod.thumbnail }"/>"
										alt="">
								</div>
								<table>
									<tr>
										<th colspan="2">${ order_details.prod.title }</th>
									</tr>
									<tr>
										<td colspan="2">${ order_details.color.color_name }-${ order_details.size.size_number }</td>
									</tr>
									<tr>
										<c:if test="${ order_details.prod.discount > 0 }">
											<th class="price"><b> $<fmt:formatNumber
														type="number" maxFractionDigits="2"
														value="${ order_details.prod.price - order_details.prod.price * order_details.prod.discount/100 }" />
											</b></th>
										</c:if>
										<c:if test="${ order_details.prod.discount <= 0 }">
											<th class="price"><b> $<fmt:formatNumber
														type="number" maxFractionDigits="2"
														value="${ order_details.prod.price }" />
											</b></th>
										</c:if>
										<td class="amount"><i>x${ order_details.quantity }</i></td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</div>

					<hr>
					<div class="calculator" style="margin-top: 100px;">
						<table>
							<tr>
								<td class="txt">
									<div class="total-products-cost">Total products cost</div>
								</td>
								<td class="price"><b>$<fmt:formatNumber type="number"
											maxFractionDigits="2" value="${ totalProd }" /></b></td>
							</tr>
							<tr>
								<td class="txt">
									<div class="shipping-chargers">Shipping charges</div>
								</td>
								<td class="price"><b>$11.00</b></td>
							</tr>
							<c:if test="${ totalProd >= 50.0 }">
								<tr>
									<td class="txt">
										<div class="shipping-chargers">Free ship</div>
									</td>
									<td class="price-free"><b>-$11.00</b></td>
								</tr>
							</c:if>
							<c:if test="${ voucher > 0 }">
								<tr>
									<td class="txt">
										<div class="shipping-chargers">Voucher</div>
									</td>
									<td class="price-free"><b>-$${ voucher }</b></td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2">
									<hr>
								</td>
							</tr>
							<c:if test="${ totalProd >= 50.0 }">
								<c:set var="fee" value="${ 0 }"></c:set>
							</c:if>
							<c:if test="${ totalProd < 50.0 }">
								<c:set var="fee" value="${ 11.0 }"></c:set>
							</c:if>
							<tr>
								<td class="txt">
									<div class="total-payment-calculator">
										<span class="txt-total-payment">Total payment</span>
									</div>
								</td>
								<td class="price"><c:if
										test="${ voucher > 0 && voucher != null}">
										<span class="total-payment"> <b>$<fmt:formatNumber
													type="number" maxFractionDigits="2"
													value="${ totalProd + fee - voucher }" />
										</b>
										</span>
									</c:if> <c:if test="${ voucher == null || voucher == 0}">
										<span class="total-payment"> <b>$<fmt:formatNumber
													type="number" maxFractionDigits="2"
													value="${ totalProd + fee}" />
										</b>
										</span>
									</c:if></td>
							</tr>
						</table>
					</div>
				</div>
				<!--  end div class order -->
			</c:if>
			<c:if test="${ listOrder == null }">
				<!-- Order -->
				<div class="order">
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
																	<th class="price"><b> $<fmt:formatNumber
																				type="number" maxFractionDigits="2"
																				value="${ prod_checkout.price - prod_checkout.price * prod_checkout.discount/100 }" />
																	</b></th>
																</c:if>
																<c:if test="${ prod_checkout.discount <= 0 }">
																	<th class="price"><b> $<fmt:formatNumber
																				type="number" maxFractionDigits="2"
																				value="${ prod_checkout.price }" />
																	</b></th>
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

					<hr>
					<div class="calculator" style="margin-top: 100px;">
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
										<div class="shipping-chargers">Free shipping</div>
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
				<!--  end div class order -->
			</c:if>
		</div>
	</form>
	
	<script type="text/javascript">
	 $(window).load(function(){
		    $('body').backDetect(function(){
		      // Callback function
		      alert("Look forward to the future, not the past!");
		    });
		  });
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