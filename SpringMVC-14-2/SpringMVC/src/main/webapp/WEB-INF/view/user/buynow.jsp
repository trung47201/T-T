<!DOCTYPE html>
<html lang="en">
<title>Checkout :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value="/assets/css/checkout.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/color.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/size_depend_color.css"/>">
<link rel="stylesheet"
	href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />">
<style>
.checkout h4 {
	margin-top: -50px !important;
	padding-bottom: 10px;
}
.avt img {
    width: 70px;
    height: 70px;
    border-radius: 100px;
    margin-top: 10px;
}
</style>
<body>
	<form action="/SpringMVC/cart/checkout/ok/${ id }" method="post">
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
			</c:if>
			<c:if test="${ userID == null }">
				<div class="avt">
					<img src="<c:url value="/assets/images/users/avt-default.jpg"/>" alt="">
				</div>
			</c:if>
			<c:if test="${ userID != null }">
				<div class="login none">
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
				<h4>Consignee information</h4>
				<c:if test="${ user != null }">
					<div class="name-customer">
						<input type="text" id="fullname" name="fullname"
							value="${ user.fullname }" placeholder="Full name">
					</div>
					<div class="phone-customer">
						<input type="number" id="phone" name="phone" min="0"
							value="${ user.phone_number }" placeholder="Phone number">
					</div>
					<div class="mail-customer">
						<input type="text" id="email" name="email" value="${ user.email }"
							placeholder="Email">
					</div>
					<div class="city-customer">
						<input type="text" id="city" name="city" value="${ city }"
							placeholder="City">
					</div>
					<div class="town-customer">
						<input type="text" id="town" name="town" value="${ town }"
							placeholder="Town">
					</div>
					<div class="village-customer">
						<input type="text" id="village" name="village"
							value="${ village }" placeholder="Village">
					</div>
					<div class="note-customer">
						<textarea id="note" name="note" placeholder="Note"></textarea>
					</div>
				</c:if>
				<c:if test="${ user == null }">
					<div class="name-customer">
						<input type="text" id="fullname" name="fullname" value=""
							placeholder="Full name">
					</div>
					<div class="phone-customer">
						<input type="number" id="phone" name="phone" min="0" value=""
							placeholder="Phone number">
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
						<input type="text" id="village" name="village"
							placeholder="Village">
					</div>
					<div class="note-customer">
						<textarea id="note" name="note" placeholder="Note"></textarea>
					</div>
				</c:if>
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
				<c:set var="prod_checkout" value="${ product }" />
				<input type="hidden" name="id_prod" id="id_prod"
					value="${ prod_checkout.id }">
				<h4>Order information</h4>
				<div class="products-checkout">
					<img
						src="<c:url value="/assets/images/products/${ prod_checkout.thumbnail }"/>"
						alt="">
					<div class="name-product-checkout">
						<b>${ prod_checkout.title }</b>
					</div>
					<c:if test="${ prod_checkout.discount > 0 }">
						<div class="price-product-checkout">
							$<fmt:formatNumber type="number" maxFractionDigits="2"
								value="${ prod_checkout.price - prod_checkout.price*prod_checkout.discount/100 }" />
						</div>
					</c:if>
					<c:if test="${ prod_checkout.discount <= 0 }">
						<div class="price-product-checkout">$${ prod_checkout.price
							}</div>
					</c:if>
				</div>
				<div class="request-product-checkout">
					<div class="color-product-details">
						<div class="list-color-product-details">
							<c:forEach var="liColor" items="${ listColor }" varStatus="index">
								<c:if test="${ index.getIndex() == 0 }">
									<span class="select-color selected-color"
										id="${ product.id }_${ liColor.color.id }"
										style="background: ${ liColor.color.rgb }"></span>
									<input type="hidden" name="color" id="color"
										value="${ liColor.color.id }">
								</c:if>
								<c:if test="${ index.getIndex() != 0 }">
									<span class="select-color"
										id="${ product.id }_${ liColor.color.id }"
										style="background: ${ liColor.color.rgb }"></span>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<c:if test="${ size != null }">
						<div class="size-product-details">
							<div class="fit-guide-size">
								<p>Size</p>
								<a href="#"> Size & Fit guide</a>
							</div>
							<c:forEach var="liSize" items="${ listSize }" varStatus="index">
								<c:set var="idProd_Size" value="${ product.id }_${ liSize.key }"></c:set>
								<c:if test="${ index.getIndex() == 0 }">
									<div class="list-size-product-details" id="${ idProd_Size }">
										<c:forEach var="liSizeByColor" items="${ liSize.value }"
											varStatus="indexS">
											<c:if test="${ size == liSizeByColor.size.id }">
												<span class="select-size selected-color"
													id="${idProd_Size }_${ liSizeByColor.size.id }"
													name="${ liSizeByColor.color.id }">${ liSizeByColor.size.size_number }</span>
												<input type="hidden" name="size" id="size"
													value="${ liSizeByColor.size.id }">
											</c:if>
											<c:if test="${  size != liSizeByColor.size.id  }">
												<span class="select-size"
													id="${idProd_Size }_${ liSizeByColor.size.id }"
													name="${ liSizeByColor.color.id }">${ liSizeByColor.size.size_number }</span>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${ index.getIndex() != 0 }">
									<div class="list-size-product-details none"
										id="${ idProd_Size }">
										<c:forEach var="liSizeByColor" items="${ liSize.value }"
											varStatus="indexS">
											<c:if test="${ indexS.getIndex() == 0 }">
												<span class="select-size"
													id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span>
											</c:if>
											<c:if test="${ indexS.getIndex() != 0 }">
												<span class="select-size"
													id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${ size == null }">
						<div class="size-product-details">
							<div class="fit-guide-size">
								<p>Size</p>
								<a href="#"> Size & Fit guide</a>
							</div>
							<c:forEach var="liSize" items="${ listSize }" varStatus="index">
								<c:set var="idProd_Size" value="${ product.id }_${ liSize.key }"></c:set>
								<c:if test="${ index.getIndex() == 0 }">
									<div class="list-size-product-details" id="${ idProd_Size }">
										<c:forEach var="liSizeByColor" items="${ liSize.value }"
											varStatus="indexS">
											<c:if test="${ indexS.getIndex() == 0 }">
												<span class="select-size selected-color"
													id="${idProd_Size }_${ liSizeByColor.size.id }"
													name="${ liSizeByColor.color.id }">${ liSizeByColor.size.size_number }</span>
												<input type="hidden" name="size" id="size"
													value="${ liSizeByColor.size.id }">
											</c:if>
											<c:if test="${ indexS.getIndex() != 0 }">
												<span class="select-size"
													id="${idProd_Size }_${ liSizeByColor.size.id }"
													name="${ liSizeByColor.color.id }">${ liSizeByColor.size.size_number }</span>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
								<c:if test="${ index.getIndex() != 0 }">
									<div class="list-size-product-details none"
										id="${ idProd_Size }">
										<c:forEach var="liSizeByColor" items="${ liSize.value }"
											varStatus="indexS">
											<c:if test="${ indexS.getIndex() == 0 }">
												<span class="select-size"
													id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span>
											</c:if>
											<c:if test="${ indexS.getIndex() != 0 }">
												<span class="select-size"
													id="${idProd_Size }_${ liSizeByColor.size.id }">${ liSizeByColor.size.size_number }</span>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</c:if>
					<div class="amount-checkout">
						<input class="minus-plus" type="button" name="" id="minus1"
							onclick="amount(this)" value="-">
						<c:if test="${ quantity != null }">
							<input class="input_Id" type="text" name="quantity"
								id="input_Id1" value="${ quantity }" readonly>
						</c:if>
						<c:if test="${ quantity == null }">
							<input class="input_Id" type="text" name="quantity"
								id="input_Id1" value="1" readonly>
						</c:if>
						<input class="minus-plus" type="button" name="" id="plus1"
							onclick="amount(this)" value="+">
					</div>
				</div>

				<div class="voucher">
					<div class="input-voucher">
						<input type="text" name="voucher_code" id="voucher_code"
							placeholder="Voucher">
					</div>
					<div class="apply-voucher">
						<input type="button" name="apply" id="apply" value="Apply">
					</div>
				</div>

				<hr>
				<div class="calculator">
					<table>
						<tr>
							<td class="txt">
								<div class="total-products-cost">Total products cost</div>
							</td>
							<c:if test="${ quantity != null && quantity > 0 }">
								<c:if test="${ prod_checkout.discount > 0 }">
									<td class="price"><b>$<fmt:formatNumber type="number"
												maxFractionDigits="2"
												value="${ (prod_checkout.price - prod_checkout.price*prod_checkout.discount/100)*quantity }" /></b></td>
								</c:if>
								<c:if test="${ prod_checkout.discount <= 0 }">
									<td class="price"><b>$${ prod_checkout.price*quantity
											}</b></td>
								</c:if>
							</c:if>
							<c:if test="${ quantity == null || quantity <= 0 }">
								<c:if test="${ prod_checkout.discount > 0 }">
									<td class="price"><b>$<fmt:formatNumber type="number"
												maxFractionDigits="2"
												value="${ prod_checkout.price - prod_checkout.price*prod_checkout.discount/100 }" /></b></td>
								</c:if>
								<c:if test="${ prod_checkout.discount <= 0 }">
									<td class="price"><b>$${ prod_checkout.price }</b></td>
								</c:if>
							</c:if>
						</tr>
						<tr>
							<td class="txt">
								<div class="shipping-chargers">Shipping charges</div>
							</td>
							<td class="price"><b>$11.00</b></td>
						</tr>
						<c:if test="${ quantity != null && quantity > 0 }">
							<!-- check free ship if quantity > 0 -->
							<c:if test="${ prod_checkout.discount > 0 }">
								<c:if
									test="${ (prod_checkout.price * quantity - prod_checkout.price * quantity * prod_checkout.discount/100) >= 50.0 }">
									<tr>
										<td class="txt">
											<div class="shipping-chargers">Free Shipping</div>
										</td>
										<td class="price-free"><b>-$11.00</b></td>
									</tr>
								</c:if>
							</c:if>
							<c:if test="${ prod_checkout.discount <= 0 }">
								<c:if test="${ (prod_checkout.price * quantity) >= 50.0 }">
									<tr>
										<td class="txt">
											<div class="shipping-chargers">Free Shipping</div>
										</td>
										<td class="price-free"><b>-$11.00</b></td>
									</tr>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${ quantity == null || quantity <= 0 }">
							<!-- check free ship if quantity == 0 -->
							<c:if test="${ prod_checkout.discount > 0 }">
								<c:if
									test="${ (prod_checkout.price - prod_checkout.price * prod_checkout.discount/100) >= 50.0 }">
									<tr>
										<td class="txt">
											<div class="shipping-chargers">Free Shipping</div>
										</td>
										<td class="price-free"><b>-$11.00</b></td>
									</tr>
								</c:if>
							</c:if>
							<c:if test="${ prod_checkout.discount <= 0 }">
								<c:if test="${ (prod_checkout.price) >= 50.0 }">
									<tr>
										<td class="txt">
											<div class="shipping-chargers">Free Shipping</div>
										</td>
										<td class="price-free"><b>-$11.00</b></td>
									</tr>
								</c:if>
							</c:if>
						</c:if>
						<c:set var="vccost" value="${ 0 }"></c:set>
						<c:if test="${ vcstatus != null && vcdiscount != null }">
							<c:if test="${ vcstatus == 'start' }">
								<c:set var="vcdis" value="${ vcdiscount }"></c:set>
								<tr>
									<td class="txt">
										<div class="shipping-chargers">Voucher</div>
									</td>
									<c:if test="${ quantity != null && quantity > 0 }">
										<c:if test="${ vcdis > 0 }">
											<c:if test="${ prod_checkout.discount > 0 }">
												<c:set var="price"
													value="${ prod_checkout.price*quantity - prod_checkout.price*quantity*prod_checkout.discount/100 }"></c:set>
												<td class="price-free"><b>-$<fmt:formatNumber
															type="number" maxFractionDigits="2"
															value="${ price*vcdis/100 }" /></b></td>
												<c:set var="vccost" value="${ price*vcdis/100 }"></c:set>
											</c:if>
											<c:if test="${ prod_checkout.discount <= 0 }">
												<td class="price-free"><b>-$<fmt:formatNumber
															type="number" maxFractionDigits="2"
															value="${ prod_checkout.price *quantity * vcdis/100 }" /></b></td>
												<c:set var="vccost"
													value="${ prod_checkout.price *quantity * vcdis/100 }"></c:set>
											</c:if>
										</c:if>
									</c:if>
									<c:if test="${ quantity == null || quantity <= 0 }">
										<c:if test="${ vcdis > 0 }">
											<c:if test="${ prod_checkout.discount > 0 }">
												<c:set var="price"
													value="${ prod_checkout.price - prod_checkout.price*prod_checkout.discount/100 }"></c:set>
												<td class="price-free"><b>-$<fmt:formatNumber
															type="number" maxFractionDigits="2"
															value="${ price*vcdis/100 }" /></b></td>
												<c:set var="vccost" value="${ price*vcdis/100 }"></c:set>
											</c:if>
											<c:if test="${ prod_checkout.discount <= 0 }">
												<td class="price-free"><b>-$<fmt:formatNumber
															type="number" maxFractionDigits="2"
															value="${ prod_checkout.price * vcdis/100 }" /></b></td>
												<c:set var="vccost"
													value="${ prod_checkout.price * vcdis/100 }"></c:set>
											</c:if>
										</c:if>
									</c:if>
								</tr>
							</c:if>
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
							<c:if test="${ vccost != 0 }">
								<c:if test="${ prod_checkout.discount > 0 }">
									<c:if test="${ quantity != null && quantity > 0 }">
										<c:if
											test="${ (prod_checkout.price *quantity - prod_checkout.price *quantity * prod_checkout.discount/100) < 50.0 }">
											<td class="price"><span class="total-payment"> <c:if
														test="${ quantity != null && quantity > 0 }">
														<b>$<fmt:formatNumber type="number"
																maxFractionDigits="2"
																value="${ prod_checkout.price*quantity - vccost - prod_checkout.price *quantity * prod_checkout.discount/100 + 11.00 }" />
														</b>
													</c:if> <c:if test="${ quantity == null || quantity <= 0 }">
														<b>$<fmt:formatNumber type="number"
																maxFractionDigits="2"
																value="${prod_checkout.price - vccost - prod_checkout.price * prod_checkout.discount/100 + 11.00 }" />
														</b>
													</c:if>
											</span></td>
										</c:if>
										<c:if
											test="${ (prod_checkout.price *quantity - prod_checkout.price *quantity * prod_checkout.discount/100) >= 50.0 }">
											<td class="price"><span class="total-payment"> <c:if
														test="${ quantity != null && quantity > 0 }">
														<b>$<fmt:formatNumber type="number"
																maxFractionDigits="2"
																value="${prod_checkout.price *quantity - vccost - prod_checkout.price *quantity * prod_checkout.discount/100  }" />
														</b>
													</c:if> <c:if test="${ quantity == null || quantity <= 0 }">
														<b>$<fmt:formatNumber type="number"
																maxFractionDigits="2"
																value="${prod_checkout.price - vccost - prod_checkout.price * prod_checkout.discount/100  }" />
														</b>
													</c:if>
											</span></td>
										</c:if>
									</c:if>
									<c:if test="${ quantity == null || quantity <= 0 }">
										<c:if
											test="${ (prod_checkout.price - prod_checkout.price * prod_checkout.discount/100) < 50.0 }">
											<td class="price"><span class="total-payment"> <c:if
														test="${ quantity != null && quantity > 0 }">
														<b>$<fmt:formatNumber type="number"
																maxFractionDigits="2"
																value="${ prod_checkout.price*quantity - vccost - prod_checkout.price *quantity * prod_checkout.discount/100 + 11.00 }" />
														</b>
													</c:if> <c:if test="${ quantity == null || quantity <= 0 }">
														<b>$<fmt:formatNumber type="number"
																maxFractionDigits="2"
																value="${prod_checkout.price - vccost - prod_checkout.price * prod_checkout.discount/100 + 11.00 }" />
														</b>
													</c:if>
											</span></td>
										</c:if>
										<c:if
											test="${ (prod_checkout.price  - prod_checkout.price * prod_checkout.discount/100) >= 50.0 }">
											<td class="price"><span class="total-payment"> <c:if
														test="${ quantity != null && quantity > 0 }">
														<b>$<fmt:formatNumber type="number"
																maxFractionDigits="2"
																value="${prod_checkout.price *quantity - vccost - prod_checkout.price *quantity * prod_checkout.discount/100  }" />
														</b>
													</c:if> <c:if test="${ quantity == null || quantity <= 0 }">
														<b>$<fmt:formatNumber type="number"
																maxFractionDigits="2"
																value="${prod_checkout.price - vccost - prod_checkout.price * prod_checkout.discount/100  }" />
														</b>
													</c:if>
											</span></td>
										</c:if>
									</c:if>
								</c:if>
								<c:if test="${ prod_checkout.discount <= 0 }">
									<c:if test="${ quantity != null && quantity > 0 }">
										<c:if test="${ (prod_checkout.price * quantity) >= 50.0 }">
											<td class="price"><span class="total-payment"> <b>$<fmt:formatNumber
															type="number" maxFractionDigits="2"
															value="${prod_checkout.price*quantity - vccost }" />
												</b>
											</span></td>
										</c:if>
									</c:if>
									<c:if test="${ quantity == null || quantity <= 0 }">
										<c:if test="${ (prod_checkout.price) >= 50.0 }">
											<td class="price"><span class="total-payment"> <b>$<fmt:formatNumber
															type="number" maxFractionDigits="2"
															value="${prod_checkout.price - vccost }" />
												</b>
											</span></td>
										</c:if>
									</c:if>
									<c:if test="${ quantity != null && quantity > 0 }">
										<c:if test="${ (prod_checkout.price*quantity) < 50.0 }">
											<td class="price"><span class="total-payment"> <b>$<fmt:formatNumber
															type="number" maxFractionDigits="2"
															value="${prod_checkout.price*quantity + 11.00 - vccost }" /></b></span></td>
										</c:if>
									</c:if>
									<c:if test="${ quantity == null || quantity <= 0 }">
										<c:if test="${ (prod_checkout.price) < 50.0 }">
											<td class="price"><span class="total-payment"> <b>$<fmt:formatNumber
															type="number" maxFractionDigits="2"
															value="${prod_checkout.price + 11.00 - vccost }" /></b></span></td>
										</c:if>
									</c:if>
								</c:if>
							</c:if>
							<c:if test="${ vccost == 0 }">
								<c:if test="${ prod_checkout.discount > 0 }">
									<c:if test="${ quantity != null && quantity > 0 }">
										<c:if
											test="${ (prod_checkout.price * quantity - prod_checkout.price * quantity * prod_checkout.discount/100) < 50.0 }">
											<c:if test="${ quantity != null && quantity > 0 }">
												<td class="price"><span class="total-payment"><b>$<fmt:formatNumber
																type="number" maxFractionDigits="2"
																value="${prod_checkout.price*quantity - prod_checkout.price*quantity * prod_checkout.discount/100 + 11.00 }" />
													</b></span></td>
											</c:if>
										</c:if>
										<c:if
											test="${ (prod_checkout.price  * quantity  - prod_checkout.price  * quantity * prod_checkout.discount/100) >= 50.0 }">
											<c:if test="${ quantity != null && quantity > 0 }">
												<td class="price"><span class="total-payment"><b>$<fmt:formatNumber
																type="number" maxFractionDigits="2"
																value="${prod_checkout.price * quantity - prod_checkout.price * quantity * prod_checkout.discount/100  }" />
													</b></span></td>
											</c:if>
										</c:if>
									</c:if>
									<c:if test="${ quantity == null || quantity <= 0 }">
										<c:if
											test="${ (prod_checkout.price - prod_checkout.price * prod_checkout.discount/100) < 50.0 }">
											<c:if test="${ quantity == null || quantity <= 0 }">
												<td class="price"><span class="total-payment"><b>$<fmt:formatNumber
																type="number" maxFractionDigits="2"
																value="${prod_checkout.price - prod_checkout.price * prod_checkout.discount/100 + 11.00 }" />
													</b></span></td>
											</c:if>
										</c:if>
										<c:if
											test="${ (prod_checkout.price - prod_checkout.price * prod_checkout.discount/100) >= 50.0 }">
											<c:if test="${ quantity == null || quantity <= 0 }">
												<td class="price"><span class="total-payment"><b>$<fmt:formatNumber
																type="number" maxFractionDigits="2"
																value="${prod_checkout.price - prod_checkout.price * prod_checkout.discount/100  }" />
													</b></span></td>
											</c:if>
										</c:if>
									</c:if>
								</c:if>
								<c:if test="${ prod_checkout.discount <= 0 }">
									<c:if test="${ quantity != null && quantity > 0 }">
										<c:if test="${ (prod_checkout.price) >= 50.0 }">
											<td class="price"><span class="total-payment"><b>$${
														prod_checkout.price * quantity }</b></span></td>
										</c:if>
									</c:if>
									<c:if test="${ quantity == null || quantity <= 0 }">
										<c:if test="${ (prod_checkout.price) >= 50.0 }">
											<td class="price"><span class="total-payment"><b>$${
														prod_checkout.price }</b></span></td>
										</c:if>
									</c:if>
									<c:if test="${ quantity != null && quantity > 0 }">
										<c:if test="${ (prod_checkout.price) < 50.0 }">
											<td class="price"><span class="total-payment"><b>$${
														prod_checkout.price * quantity +11.00 }</b></span></td>
										</c:if>
									</c:if>
									<c:if test="${ quantity == null || quantity <= 0 }">
										<c:if test="${ (prod_checkout.price) < 50.0 }">
											<td class="price"><span class="total-payment"><b>$${
														prod_checkout.price+11.00 }</b></span></td>
										</c:if>
									</c:if>
								</c:if>
							</c:if>
						</tr>
					</table>
				</div>

			</div>
		</div>

		<input type="hidden" name="vccode" id="vccode" value="${ vccode }">
		<input type="hidden" name="idprod" id="idprod" value="${ idprod }">

		<div class="btn-order">
			<input type="button" name="order" id="order" value="Order">
		</div>
	</form>

	<div class="wrapper importantNone" id="wrapper">
		<div class="message message-notify none" id="message-notify">
			<h2 class="msg-h2">
				Message <img alt=""
					src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>">
			</h2>
			<p class="content-msg" id="content-msg-notify"></p>
			<div class="btn-ok-cancel">
				<input class="ok hover-btn" id="ok-notify" type="button" value="OK">
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



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
				$("#message-notify").removeClass("none");
				$("#content-msg-notify").text(error);
			}
		});
	</script>
	<script type="text/javascript"> //message voucher status
		if(${vcstatus != null}) {
			var status = "${ vcstatus }";
			if(status == "outofdate" ) {
				$("#wrapper").removeClass("importantNone");
				$("#message-notify").removeClass("none");
				$("#content-msg-notify").text("Sorry! The event has ended.");
			}
			if(status == "notstartedyet" ) {
				$("#wrapper").removeClass("importantNone");
				$("#message-notify").removeClass("none");
				$("#content-msg-notify").text("Sorry! The event has not started yet.");
			}
			if(status == "notexists" ) {
				$("#wrapper").removeClass("importantNone");
				$("#message-notify").removeClass("none");
				$("#content-msg-notify").text("Sorry! Voucher does not exist.");
			}
			if(status == "notenough") {
				if(${ applyfor != null }) {
					$("#wrapper").removeClass("importantNone");
					$("#message-notify").removeClass("none");
					var error = "Sorry! Voucher is only applicable for orders of ${ applyfor } or more.";
					$("#content-msg-notify").text(error);
				}
			}
		}
	</script>

	<script type="text/javascript">
		var id="";
		if(${ id != null }) {
			id = "${id}";
		}
		var url = window.location.href;
		var url_new = "";
		$("#apply").click(function() {
			var vch = $('#voucher_code').val();
			if(vch == "" || vch == null) {
				$("#wrapper").removeClass("importantNone");
				$("#message-notify").removeClass("none");
				$("#content-msg-notify").text("You have not entered the voucher!");
			} else {
				if (id != "") {
					if(url.includes("?")) {
						if(url.includes("?voucher")) {
							var arr1 = url.split("?")[1];
							var arr2 = arr1.split("&")[0];
							url_new = url.replace(arr2, "voucher="+vch);
						} else if(url.includes("&voucher")) {
							const arr1 = url.split("&");
							for(let i=0; i<arr1.length; i++) {
								if(arr1[i].includes("voucher")) {
									url_new = url.replace(arr1[i], "voucher="+vch);
								}
							}
						} else {
							url_new = url+"&voucher="+vch;
						}
					} else {
						url_new = url+"?voucher="+vch;
					}
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "");
					xhr.onload = function() {
						window.location.assign(url_new);
					};
					xhr.send();
				}
			}
		});
		$("#ok-notify").click(function() {
			$("#wrapper").addClass("importantNone");
			$("#message-notify").addClass("none");
		});
	</script>

	<script type="text/javascript"> // chosen size
		var url = window.location.href;
		var url_new = "";
		var sizes = document.getElementsByClassName("select-size");
		$(document).ready(function() {
			$(".select-size").click(function() {
				for (let i=0; i<sizes.length; i++) {
					if (sizes[i].id == this.id) {
						$(this).addClass("selected-color");
						var txt = this.id;
						const arr = txt.split("_");
						var size_id = arr[2];
						document.getElementById("size").value = size_id;
						if(url.includes("?")) {
							if(url.includes("?size")) {
								var arr1 = url.split("?")[1];
								var arr2 = arr1.split("&")[0];
								url_new = url.replace(arr2, "size="+size_id);
							} else if(url.includes("&size")) {
								const arr1 = url.split("&");
								for(let i=0; i<arr1.length; i++) {
									if(arr1[i].includes("size")) {
										url_new = url.replace(arr1[i], "size="+size_id);
									}
								}
							} else {
								url_new = url+"&size="+size_id;
							}
						} else {
							url_new = url+"?size="+size_id;
						}
					} else {
						$(sizes[i]).removeClass("selected-color");
					}
				}
				if(url_new != "") {
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "");
					xhr.onload = function() {
						window.location.assign(url_new);
					};
					xhr.send();
				} else {
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "");
					xhr.onload = function() {
						window.location.assign(url);
					};
					xhr.send();
				}
				
			});
		});
	</script>
	<script type="text/javascript"> // chosen color
		var size = document.getElementsByClassName("list-size-product-details");
		var color = document.getElementsByClassName("select-color");
		var sizes = document.getElementsByClassName("select-size");
		$(document).ready(function() {
			$(".select-color").click(function() {
				for (let i=0; i<color.length; i++) {
					if (color[i].id == this.id) {
						$(this).addClass("selected-color");
						var txt = this.id;
						const arr = txt.split("_");
						var color_id = arr[1];
						document.getElementById("color").value = color_id;
					} else {
						$(color[i]).removeClass("selected-color");
						for (let j=0; j<sizes.length; j++) {
							$(sizes[j]).removeClass("selected-color");
						}
					}
				}
				for (let i=0; i<size.length; i++) {
					if (size[i].id == this.id) {
						$(size[i]).removeClass("none");
					} else {
						$(size[i]).addClass("none");
					}
				}
			});
		});
	</script>

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
		var url = window.location.href;
		var url_new = "";
		function amount(x) {
			if (x.id == "plus1") {
				var input_txt = document.getElementById("input_Id1").value;
				let a = parseInt(input_txt) + 1;
				document.getElementById("input_Id1").value = a;
				if(url.includes("?")) {
					if(url.includes("?quantity")) {
						var arr = url.split("?")[1];
						var arr1 = arr.split("&")[0];
						url_new = url.replace(arr1, "quantity="+a);
					} else if(url.includes("&quantity")) {
						const arr = url.split("&");
						for(let i=0; i<arr.length; i++) {
							if(arr[i].includes("quantity")) {
								url_new = url.replace(arr[i], "quantity="+a);
							}
						}
					} else {
						url_new = url+"&quantity="+a;
					}
				} else {
					url_new = url+"?quantity="+a;
				}
			} else if (x.id == "minus1") {
				var input_txt = document.getElementById("input_Id1").value;
				if (parseInt(input_txt) > 1) {
					let a = parseInt(input_txt) - 1;
					document.getElementById("input_Id1").value = a;
					if(url.includes("?quantity")) {
						var arr = url.split("?")[1];
						var arr1 = arr.split("&")[0];
						url_new = url.replace(arr1, "quantity="+a);
					} else if(url.includes("&quantity")) {
						const arr = url.split("&");
						for(let i=0; i<arr.length; i++) {
							if(arr[i].includes("quantity")) {
								url_new = url.replace(arr[i], "quantity="+a);
							}
						}
					} else {
						url_new = url+"&quantity="+a;
					}
				}
			}
			if(url_new != "") {
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "");
				xhr.onload = function() {
					window.location.assign(url_new);
				};
				xhr.send();
			} else {
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "");
				xhr.onload = function() {
					window.location.assign(url);
				};
				xhr.send();
			}
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