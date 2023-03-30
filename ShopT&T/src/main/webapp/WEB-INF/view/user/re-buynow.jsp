<!DOCTYPE html>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<html lang="en">
<title>Checkout :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-checkout.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/color.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/r-size_depend_color.css"/>">
<link rel="stylesheet"
	href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-btn-effect.css"/>">
	<link rel="stylesheet"
	href="<c:url value="/assets/css/checkbox-radio-input.css"/>">
<style>
.icon-cod {
    display: flex;
    align-items: center;
}
</style>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store");
	if (session.getAttribute("order") != null && session.getAttribute("order") != "") {
		if (session.getAttribute("order").equals("end")) {
			response.sendRedirect("/ShopTandT/");
		}
	}
	%>
	<form action="/ShopTandT/cart/checkout/ok/${ id }" method="post"
		id="myform">
		<div class="header">
			<c:if test="${ sessionScope.userid != null }">
				<c:if test="${ sessionScope.avatar != null }">
					<div class="avt">
						<img
							src="<c:url value="/assets/images/users/${ sessionScope.avatar }"/>"
							alt="">
					</div>
				</c:if>
				<c:if test="${ sessionScope.avatar == null }">
					<div class="avt">
						<img src="<c:url value="/assets/images/users/avt-default.jpg"/>"
							alt="">
					</div>
				</c:if>
			</c:if>
			<c:if test="${ sessionScope.userid == null }">
				<div class="avt">
					<img src="<c:url value="/assets/images/users/avt-default.jpg"/>"
						alt="">
				</div>
			</c:if>
			<c:if test="${ sessionScope.userid == null }">
				<div class="login">
					<a class='a-login' href="/ShopTandT/account/login">Login</a>&nbsp;/&nbsp;
					<a href="/ShopTandT/account/signup">Sign Up</a>
				</div>
			</c:if>
		</div>

		<div class="checkout">
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
					<div class="price-product-checkout">
						$
						<fmt:formatNumber type="number" maxFractionDigits="2"
							value="${ prod_checkout.price - prod_checkout.price*prod_checkout.discount/100 }" />
					</div>
				</div>
				<div class="request-product-checkout">
					<div class="color-product-details">
						<div class="title-color">
							<p>Color</p>
						</div>
						<div class="list-color-product-details">
							<c:forEach var="liColor" items="${ listColor }" varStatus="index">
								<c:if test="${ color != null }">
									<c:if test="${ color == liColor.color.id }">
										<span class="select-color selected-color"
											id="${ product.id }_${ liColor.color.id }"
											style="background: ${ liColor.color.rgb }"></span>
										<input type="hidden" name="color" id="color"
											value="${ liColor.color.id }">
									</c:if>
									<c:if test="${ color != liColor.color.id }">
										<span class="select-color"
											id="${ product.id }_${ liColor.color.id }"
											style="background: ${ liColor.color.rgb }"></span>
									</c:if>
								</c:if>
								<c:if test="${ color == null }">
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
								</c:if>
							</c:forEach>
						</div>
					</div>
					<c:if test="${ size != null && size != '' }">
						<div class="size-product-details">
							<div class="fit-guide-size">
								<p>Size</p>
								<a href="#"> Size & Fit guide</a>
							</div>
							<c:forEach var="liSize" items="${ listSize }" varStatus="index">
								<c:set var="idProd_Size" value="${ product.id }_${ liSize.key }"></c:set>
								<c:if test="${ color != null }">
									<c:if test="${ color == liSize.key }">
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
									<c:if test="${ color != liSize.key }">
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
								</c:if>
								<c:if test="${ color == null }">
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
								</c:if>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${ size == null || size == '' }">
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
						<c:if test="${ quantity != null &&  quantity != ''}">
							<input class="input_Id" type="text" name="quantity"
								id="input_Id1" value="${ quantity }" readonly>
						</c:if>
						<c:if test="${ quantity == null || quantity == ''}">
							<input class="input_Id" type="text" name="quantity"
								id="input_Id1" value="1" readonly>
						</c:if>
						<input class="minus-plus" type="button" name="" id="plus1"
							onclick="amount(this)" value="+">
					</div>
				</div>

				<c:if test="${ userID != null }">
					<div class="voucher">
						<div class="input-voucher">
							<input type="text" name="voucher" id="voucher"
								placeholder="Voucher">
						</div>
						<div class="btn-effect">
							<button type="button" name="apply" id="apply">Apply</button>
						</div>
					</div>
				</c:if>

				<hr>
				<div class="calculator">
					<table>
						<tr>
							<td class="txt">
								<div class="total-products-cost">Total products cost</div>
							</td>
							<c:if test="${ quantity != null && quantity > 0 }">
								<td class="price p_prod"><b>$<fmt:formatNumber
											type="number" maxFractionDigits="2"
											value="${ (prod_checkout.price - prod_checkout.price*prod_checkout.discount/100)*quantity }" /></b></td>
							</c:if>
							<c:if test="${ quantity == null || quantity <= 0 }">
								<td class="price p_prod"><b>$<fmt:formatNumber
											type="number" maxFractionDigits="2"
											value="${ prod_checkout.price - prod_checkout.price*prod_checkout.discount/100 }" /></b></td>
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
							<c:if
								test="${ (prod_checkout.price * quantity - prod_checkout.price * quantity * prod_checkout.discount/100) >= 50.0 }">
								<tr class="tr-shipping">
									<td class="txt">
										<div class="shipping-chargers">Free Shipping</div>
									</td>
									<td class="price-free"><b>-$11.00</b></td>
								</tr>
							</c:if>
							<c:if
								test="${ (prod_checkout.price * quantity - prod_checkout.price * quantity * prod_checkout.discount/100) < 50.0 }">
								<tr class="tr-shipping none">
									<td class="txt">
										<div class="shipping-chargers">Free Shipping</div>
									</td>
									<td class="price-free"><b>-$11.00</b></td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${ quantity == null || quantity <= 0 }">
							<!-- check free ship if quantity <= 0 or null -->
							<c:if
								test="${ (prod_checkout.price - prod_checkout.price * prod_checkout.discount/100) >= 50.0 }">
								<tr class="tr-shipping">
									<td class="txt">
										<div class="shipping-chargers">Free Shipping</div>
									</td>
									<td class="price-free"><b>-$11.00</b></td>
								</tr>
							</c:if>
							<c:if
								test="${ (prod_checkout.price * quantity - prod_checkout.price * quantity * prod_checkout.discount/100) < 50.0 }">
								<tr class="tr-shipping none">
									<td class="txt">
										<div class="shipping-chargers">Free Shipping</div>
									</td>
									<td class="price-free"><b>-$11.00</b></td>
								</tr>
							</c:if>
						</c:if>
						<c:set var="vccost" value="${ 0 }"></c:set>
						<c:if test="${ vcstatus != null && vcdiscount != null }">
							<c:if test="${ vcstatus == 'start' }">
								<c:set var="vcdis" value="${ vcdiscount }"></c:set>
								<tr class="tr-vch">
									<td class="txt">
										<div class="shipping-chargers">Voucher</div>
									</td>
									<c:if test="${ quantity != null && quantity > 0 }">
										<c:if test="${ vcdis > 0 }">
											<c:set var="price"
												value="${ prod_checkout.price*quantity - prod_checkout.price*quantity*prod_checkout.discount/100 }"></c:set>
											<td class="price-free vch-free"><b>-$<fmt:formatNumber
														type="number" maxFractionDigits="2"
														value="${ price*vcdis/100 }" /></b></td>
											<c:set var="vccost" value="${ price*vcdis/100 }"></c:set>
										</c:if>
									</c:if>
									<c:if test="${ quantity == null || quantity <= 0 }">
										<c:if test="${ vcdis > 0 }">
											<c:set var="price"
												value="${ prod_checkout.price - prod_checkout.price*prod_checkout.discount/100 }"></c:set>
											<td class="price-free vch-free"><b>-$<fmt:formatNumber
														type="number" maxFractionDigits="2"
														value="${ price*vcdis/100 }" /></b></td>
											<c:set var="vccost" value="${ price*vcdis/100 }"></c:set>
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
								<c:if test="${ quantity != null && quantity > 0 }">
									<c:if
										test="${ (prod_checkout.price * quantity - prod_checkout.price *quantity * prod_checkout.discount/100) < 50.0 }">
										<td class="price p_total"><span class="total-payment">
												<c:if test="${ quantity != null && quantity > 0 }">
													<b id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${ prod_checkout.price*quantity - vccost - prod_checkout.price *quantity * prod_checkout.discount/100 + 11.00 }" />
													</b>
												</c:if> <c:if test="${ quantity == null || quantity <= 0 }">
													<b id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price - vccost - prod_checkout.price * prod_checkout.discount/100 + 11.00 }" />
													</b>
												</c:if>
										</span></td>
									</c:if>
									<c:if
										test="${ (prod_checkout.price *quantity - prod_checkout.price *quantity * prod_checkout.discount/100) >= 50.0 }">
										<td class="price p_total"><span class="total-payment">
												<c:if test="${ quantity != null && quantity > 0 }">
													<b id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price *quantity - vccost - prod_checkout.price *quantity * prod_checkout.discount/100  }" />
													</b>
												</c:if> <c:if test="${ quantity == null || quantity <= 0 }">
													<b id="total-payment">$<fmt:formatNumber type="number"
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
										<td class="price p_total"><span class="total-payment">
												<c:if test="${ quantity != null && quantity > 0 }">
													<b id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${ prod_checkout.price*quantity - vccost - prod_checkout.price *quantity * prod_checkout.discount/100 + 11.00 }" />
													</b>
												</c:if> <c:if test="${ quantity == null || quantity <= 0 }">
													<b id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price - vccost - prod_checkout.price * prod_checkout.discount/100 + 11.00 }" />
													</b>
												</c:if>
										</span></td>
									</c:if>
									<c:if
										test="${ (prod_checkout.price  - prod_checkout.price * prod_checkout.discount/100) >= 50.0 }">
										<td class="price p_total"><span class="total-payment">
												<c:if test="${ quantity != null && quantity > 0 }">
													<b id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price *quantity - vccost - prod_checkout.price *quantity * prod_checkout.discount/100  }" />
													</b>
												</c:if> <c:if test="${ quantity == null || quantity <= 0 }">
													<b id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price - vccost - prod_checkout.price * prod_checkout.discount/100  }" />
													</b>
												</c:if>
										</span></td>
									</c:if>
								</c:if>
							</c:if>
							<c:if test="${ vccost == 0 }">
								<c:if test="${ quantity != null && quantity > 0 }">
									<c:if
										test="${ (prod_checkout.price * quantity - prod_checkout.price * quantity * prod_checkout.discount/100) < 50.0 }">
										<c:if test="${ quantity != null && quantity > 0 }">
											<td class="price p_total"><span class="total-payment"><b
													id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price*quantity - prod_checkout.price*quantity * prod_checkout.discount/100 + 11.00 }" />
												</b></span></td>
										</c:if>
									</c:if>
									<c:if
										test="${ (prod_checkout.price  * quantity  - prod_checkout.price  * quantity * prod_checkout.discount/100) >= 50.0 }">
										<c:if test="${ quantity != null && quantity > 0 }">
											<td class="price p_total"><span class="total-payment"><b
													id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price * quantity - prod_checkout.price * quantity * prod_checkout.discount/100  }" />
												</b></span></td>
										</c:if>
									</c:if>
								</c:if>
								<c:if test="${ quantity == null || quantity <= 0 }">
									<c:if
										test="${ (prod_checkout.price - prod_checkout.price * prod_checkout.discount/100) < 50.0 }">
										<c:if test="${ quantity == null || quantity <= 0 }">
											<td class="price p_total"><span class="total-payment"><b
													id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price - prod_checkout.price * prod_checkout.discount/100 + 11.00 }" />
												</b></span></td>
										</c:if>
									</c:if>
									<c:if
										test="${ (prod_checkout.price - prod_checkout.price * prod_checkout.discount/100) >= 50.0 }">
										<c:if test="${ quantity == null || quantity <= 0 }">
											<td class="price p_total"><span class="total-payment"><b
													id="total-payment">$<fmt:formatNumber type="number"
															maxFractionDigits="2"
															value="${prod_checkout.price - prod_checkout.price * prod_checkout.discount/100  }" />
												</b></span></td>
										</c:if>
									</c:if>
								</c:if>
							</c:if>
						</tr>
					</table>
				</div>
				<!-- end div class "calculator" -->
			</div>
			<!-- end div class "order" -->

			<!-- Consignee information -->
			<div class="customer-info">
				<h4>Shipping methods</h4>
				<div class="shipping" id="radio1">
					<div>
						<input type="radio" name="Delivery" id="rad1" checked>&emsp;Delivery
						to your place
					</div>
					<div>&emsp;&emsp;&emsp;$11.00</div>
				</div>
				<div class="content-sm" id="content-sm">Buy products over $50
					will get free shipping</div>
				<h4 class="pm">Payment methods</h4>

				<div class="shipping" id="radio2" onclick="radio(this)">
					<div class="icon-cod">
						<c:if test="${ method == 'cod' ||  method == null }">
							<input type="radio" name="paymentmethods" id="rad2" value="cod"
								checked>
						</c:if>
						<c:if test="${ method != 'cod' &&  method != null }">
							<input type="radio" name="paymentmethods" id="rad2" value="cod">
						</c:if>
						&emsp;Payment on delivery (COD)
					</div>
					<img
						src="<c:url value="/assets/images/icons/cash-on-delivery.png"/>"
						alt="">
				</div>

				<c:if test="${ method == 'cod' ||  method == null }">
					<div class="content-pm" id="content-pm"
						style="visibility: visible;">You only have to pay when you
						receive the goods.</div>
				</c:if>

				<c:if test="${ method != 'cod' &&  method != null }">
					<div class="content-pm none" id="content-pm"
						style="visibility: visible;">You only have to pay when you
						receive the goods.</div>
				</c:if>

				<c:if test="${ sessionScope.userid != null || userID != null}">
					<div class="shipping" id="radio3" onclick="radio(this)">
						<div class="icon-credit">
							<c:if test="${ method == 'card' }">
								<input type="radio" name="paymentmethods" id="rad3" value="card"
									checked>
							</c:if>
							<c:if test="${ method != 'card' }">
								<input type="radio" name="paymentmethods" id="rad3" value="card">
							</c:if>
							&emsp; Pay by credit card
						</div>
						<img src="<c:url value="/assets/images/icons/credit-card.png"/>"
							alt="">
					</div>
					<c:if test="${ method != 'card' }">
						<div class="content-bank none" id="content-bank"
							style="visibility: visible;">
							<div>Choose a</div>
							<div class="bank">
								<div class="bank" id="Paypal" onclick="bank(this)">
									<img
										src="<c:url value="/assets/images/icons/icons8-paypal-96.png"/>"
										alt="">
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${ method == 'card' }">
						<div class="content-bank" id="content-bank"
							style="visibility: visible;">
							<div>Choose a</div>
							<div class="bank">
								<div class="bank" id="Paypal" onclick="bank(this)">
									<img
										src="<c:url value="/assets/images/icons/icons8-paypal-96.png"/>"
										alt="">
								</div>
							</div>
						</div>
					</c:if>
				</c:if>
				<h4>Consignee information</h4>
				<c:if test="${ user != null }">
					<div class="name-customer">
						<input type="text" id="firstname" name="firstname"
							value="${ user.firstname }" placeholder="First name"> <input
							type="text" id="lastname" name="lastname"
							value="${ user.lastname }" placeholder="Last name">
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
						<!-- city -->
						<select class="none" name="calc_shipping_provinces"
							id="selected-city">
							<option value="" disabled="disabled" selected>Province /
								City</option>
						</select> <input class="billing_address_1" name="" type="hidden"> <input
							type="text" id="city" name="city" placeholder="City"
							value="${ user.city }">
						<!-- district -->
						<select class="none" name="calc_shipping_district"
							id="selected-district">
							<option value="" disabled="disabled" selected>District</option>
						</select> <input class="billing_address_2" name="" type="hidden"> <input
							type="text" id="district" name="district" placeholder="District"
							value="${ user.district }">
						<!-- address -->
						<input type="text" id="address" name="address"
							placeholder="Address" value="${ user.address }">
					</div>
					<div class="note-customer">
						<textarea id="note" name="note" placeholder="Note"></textarea>
					</div>
				</c:if>
				<c:if test="${ user == null }">
					<div class="name-customer">
						<input type="text" id="firstname" name="firstname" value=""
							placeholder="First name"> <input type="text"
							id="lastname" name="lastname" value="" placeholder="Last name">
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
						<!-- city -->
						<select class="none" name="calc_shipping_provinces"
							id="selected-city">
							<option value="" disabled="disabled" selected>Province /
								City</option>
						</select> <input class="billing_address_1" name="" type="hidden"> <input
							type="text" id="city" name="city" placeholder="Province / City"
							value="${ user.city }">
						<!-- district -->
						<select class="none" name="calc_shipping_district"
							id="selected-district">
							<option value="" disabled="disabled" selected>District</option>
						</select> <input class="billing_address_2" name="" type="hidden"> <input
							type="text" id="district" name="district" placeholder="District"
							value="${ user.district }">
						<!-- address -->
						<input type="text" id="address" name="address"
							placeholder="Address" value="${ user.address }">
					</div>
					<div class="note-customer">
						<textarea id="note" name="note" placeholder="Note"></textarea>
					</div>
				</c:if>
				<div class="btn-order">
					<div class="btn-order-effect">
						<button type="button" name="order" id="order" value="">Order</button>
					</div>
					
				</div>
				<div class="backtocart">
					<c:if test="${ sessionScope.userid != null }">
						<a href="/ShopTandT/cart/${ sessionScope.userid }">Cancel</a>
					</c:if>
					<c:if test="${ sessionScope.userid == null }">
						<a href="/ShopTandT/cart">Cancel</a>
					</c:if>
				</div>
			</div>
		</div>

		<input type="hidden" name="total" id="total" value="${ total }">
		<input type="hidden" name="vccode" id="vccode" value="${ vccode }">
		<input type="hidden" name="idprod" id="idprod" value="${ idprod }">
		<input type="hidden" name="userid" id="userid" value="${ id_user }">
		<input type="hidden" name="cartid" value="${ cartid }">
		<c:if test="${ vchprice != null }">
			<input type="hidden" name="vchprice" id="vchprice"
				value="${ vchprice }">
		</c:if>

		<input type="hidden" name="price" id="price"
			value="${ prod_checkout.price - prod_checkout.price * prod_checkout.discount / 100 }">
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
	$(".a-login").click(function () {
		var url = window.location.href;
		var xhr = new XMLHttpRequest();
		xhr.open("GET", url+"?login");
		xhr.onload = function() {
		};
		xhr.send();
	});
	</script>

	<script>
	function radio(x) {
		if(x.id == "radio2") {
			document.getElementById("rad2").checked = true;
			$("#content-pm").removeClass("none");
			$("#content-bank").addClass("none");
		} else if(x.id == "radio3") {
			document.getElementById("rad3").checked = true;
			$("#content-pm").addClass("none");
			$("#content-bank").removeClass("none");
		}
	}
	</script>

	<script type="text/javascript">
		const validateEmail = (email) => {
		  	return email.match(
		    	/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
		  	);
		};
		$("#order").click(function() {
			var get = $(this);
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var city = $("#city").val();
			var district = $("#district").val();
			var address = $("#address").val();
			var quantity = $("#input_Id1").val();
			var id_prod = 	$("#id_prod").val();
			var size = 	$("#size").val();
			
			var method;
			if(${ sessionScope.userid != null }) {
				method = document.getElementById("rad3").checked;
			}
			
			var error = "";
			if(size == "") {
				error = "You haven't select a size yet!";
			} else if(firstname == "") {
				error = "Firstname name is empty!";
			} else if(lastname == "") {
				error = "Lastname is empty!";
			} else if(phone == "") {
				error = "Phone number is empty!";
			} else if(email == "") {
				error = "Email address is empty!";
			} else if(!validateEmail(email)) {
				error = "Invalid email format!";
			} else if(city == "") {
				error = "City is empty!";
			} else if(district == "") {
				error = "District is empty!";
			}
			if (error == "") {
				if(method == true) {
					var product = id_prod+"_"+quantity;
					$('#myform').attr('action', "/ShopTandT/authorize_payment?product="+product);
					$(get).attr("type", "submit");
				} else {
					$(get).attr("type", "submit");
				}
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
			if(status == "used" ) {
				$("#wrapper").removeClass("importantNone");
				$("#message-notify").removeClass("none");
				$("#content-msg-notify").text("Sorry! You have used this voucher.");
			}
		}
	</script>

	<script type="text/javascript"> //aplly voucher
		var id="";
		if(${ id != null }) {
			id = "${id}";
		}
		$("#apply").click(function() {
			var get = this;
			var vch = $('#voucher').val();
			if(vch == "" || vch == null) {
				$("#wrapper").removeClass("importantNone");
				$("#message-notify").removeClass("none");
				$("#content-msg-notify").text("You have not entered the voucher!");
			} else {
				$("#myform").attr("action", "/ShopTandT/cart/checkout/"+id)
				$(this).attr("type", "submit");
			}
		});
		$("#ok-notify").click(function() {
			$("#wrapper").addClass("importantNone");
			$("#message-notify").addClass("none");
		});
	</script>

	<script type="text/javascript"> // chosen size
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
						var test = document.getElementById("size").value;
					} else {
						$(sizes[i]).removeClass("selected-color");
					}
				}
s			});
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
						var test = document.getElementById("color").value;
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
				document.getElementById("size").value = "";
				var test1 = document.getElementById("size").value;
			});
		});
	</script>

	<script>
		var apply_for = "${ applyfor }";
		var vc_price = 0;
		if(${ vcdiscount != null }) {
			var vc = "${ vcdiscount }";
			vc_price = parseInt(vc);
		}
		function amount(x) {
			if (x.id == "plus1") {
				var input_txt = document.getElementById("input_Id1").value;
				let a = parseInt(input_txt) + 1;
				document.getElementById("input_Id1").value = a;
			} else if (x.id == "minus1") {
				var input_txt = document.getElementById("input_Id1").value;
				if (parseInt(input_txt) > 1) {
					let a = parseInt(input_txt) - 1;
					document.getElementById("input_Id1").value = a;
				}
			}
			var qty = document.getElementById("input_Id1").value;
			var price = document.getElementById("price").value;
			var calc = parseFloat(qty) * parseFloat(price);
			var vch_at = parseFloat(qty) * parseFloat(price) * parseFloat(vc_price) / 100;
			$("td.p_prod b").text("$"+parseFloat(Math.round(calc * 100)/100));
			if(calc >= 50) {
				$("td.p_total b").text("$"+parseFloat(Math.round((calc-vch_at) * 100)/100));
				if(price < 50) {
					$("tr.tr-shipping").removeClass("none");
				}
				$(".vch-free b").text("-$"+vch_at);
				$("tr.tr-vch").removeClass("none");
				$("#total").val(calc);
			} else {
				$("#total").val(calc);
				calc = calc + 11.0;
				$("td.p_total b").text("$"+parseFloat(Math.round(calc * 100)/100));
				$("tr.tr-shipping").addClass("none");
				$("tr.tr-vch").addClass("none");
				if(vc_price != 0) {
					$("#wrapper").removeClass("importantNone");
					$("#message-notify").removeClass("none");
					var error = "Sorry! Voucher is only applicable for orders of "+apply_for+" or more.";
					$("#content-msg-notify").text(error);
				}
			}
		}
	</script>

	<script type="text/javascript"> // address infor
		$("select option[value='District']").attr('disabled', true);
		$("#city").hover(function() {
			$(this).attr("type", "hidden");
			$("#selected-city").removeClass("none");
		});
		$("#selected-city").mouseout(function() {
			$("#city").attr("type", "text");
			$(this).addClass("none");
		});
		$("#selected-city").change(function() {
			 var city = $(this).find('option:selected').text();
			 $("#city").val(city);
		});
		
		$("#district").hover(function() {
			$(this).attr("type", "hidden");
			$("#selected-district").removeClass("none");
		});
		$("#selected-district").mouseout(function() {
			$("#district").attr("type", "text");
			$(this).addClass("none");
		});
		$("#selected-district").change(function() {
			 var district = $(this).find('option:selected').text();
			 $("#district").val(district);
		});
	</script>

	<script type="text/javascript">
	history.pushState(null, null, location.href);
	window.onpopstate = function () {
	  history.go(1);
	};
	</script>


	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
		}
	</script>

	<script
		src='https://cdn.jsdelivr.net/gh/vietblogdao/js/districts.min.js'></script>
	<script src="<c:url value="/assets/js/re-select-address.js" />"></script>

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