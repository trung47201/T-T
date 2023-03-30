<!DOCTYPE html>
<html lang="en">
<title>Cart :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value="/assets/css/bootstrap.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/js/bootstrap.js"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-index.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/swiper-bundle.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-cart.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/message.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/navscroll.css"/>">
<link rel="stylesheet"
	href='<c:url value="/assets/css/login-icon.css"/>'>
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/checkbox-radio-input.css"/>">
<style>
</style>
<body style="color: black;">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store");
	if (session.getAttribute("login") != null && session.getAttribute("login") != "") {
		if (session.getAttribute("login").equals("end")) {
			response.sendRedirect("/ShopTandT/cart");
		}
	}
	%>
	<jsp:include page="../layouts/user/re-menu.jsp"></jsp:include>
	<div class="back-header">
		<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
	</div>
	<div class="img-header">
		<img alt=""
			src="<c:url value="/assets/images/poster/adriana_klas_photography-9636_1200x.webp"/>">
	</div>
	<header class="container-xl header-content">
		<form method="post">
			<!--######################################################################################################### -->
			<div class="text">
				<h3>Shopping</h3>
				<p class="cool">
					<span data-text="bag" style="color: white;">bag</span>
				</p>
			</div>
			<c:set var="getProdCountCart" value="${ 0 }"></c:set>
			<c:forEach var="item" items="${ cart }" varStatus="index">
				<c:set var="getProdCountCart" value="${ index.getCount() }"></c:set>
			</c:forEach>
			<c:if test="${ getProdCountCart==0 }">
				<div class="cart-empty">
					<h5>Cart is empty. Please add products so that the cart is not
						empty.</h5>
				</div>
				<div class="cart-empty">
					<div class="btn-effect">
						<button type="submit" name="continueShopping"
							id="continue-shopping">Shopping</button>
					</div>
				</div>
			</c:if>
			<c:if test="${ getProdCountCart != 0 }">
				<div class="list-products">
					<table>
						<tr>
							<th>
								<div class="checkbox-cart"></div>
								<div class="product-cart">Product</div>
								<div class="classify-cart">Classify</div>
								<div class="price-cart">Price</div>
								<div class="amount-cart">Amount</div>
								<div class="total-money-cart">Total money</div>
								<div class="del-product-cart"></div>
							</th>
						</tr>
						<tr>
							<c:forEach var="item" items="${ cart }" varStatus="index">
								<td>
									<div class="checkbox-cart">
										<c:if test="${ item.color_size.prod.discount <= 0 }">
											<input type="checkbox" class="foo" name="${ item.id }"
												id="${ item.quantity }"
												value="${ item.color_size.prod.price }">
										</c:if>
										<c:if test="${ item.color_size.prod.discount > 0 }">
											<input type="checkbox" class="foo" name="${ item.id }"
												id="${ item.quantity }"
												value="${ item.color_size.prod.price - item.color_size.prod.price * item.color_size.prod.discount/100 }">
										</c:if>
									</div>
									<div class="product-cart">
										<img
											src="<c:url value="/assets/images/products/${ item.color_size.prod.thumbnail }"/>"
											alt="product-img">
										<div class="name-product-cart">${ item.color_size.prod.title }</div>
									</div>
									<div class="classify-cart">
										<c:forEach var="it" items="${ hmProd_Color_Size }">
											<c:if test="${ item.color_size.prod.id == it.key }">
												<select id="${ it.key }" name="color${ it.key }"
													onchange="color_select(this)" class="color">
													<option value="" style="display: none;" disabled selected>Choose
														color</option>
													<c:forEach var="it_color" items="${ it.value }">
														<c:forEach var="colorName" items="${ listAllColor }">
															<c:if test="${ it_color.key == colorName.id }">
																<option style="background: ${ colorName.rgb };"
																	value="${ it_color.key }_${ item.color_size.prod.id }_${ item.id }"
																	<c:if test="${colorName.id==item.color_size.color.id }">
																			<c:out value="selected"></c:out>
																	</c:if>>
																	${colorName.color_name }</option>
															</c:if>
														</c:forEach>
													</c:forEach>
												</select>


												<c:forEach var="it_color" items="${ it.value }">
													<c:set var="sKey"
														value="${ it_color.key }_${ item.color_size.prod.id }"></c:set>
													<select
														id="${ it_color.key }_${ item.color_size.prod.id }_${ item.id }"
														class="size" name="size" onchange="size_select(this)">
														<option value="" style="display: none;" disabled selected>Choose
															size</option>
														<c:forEach var="it_size" items="${ it_color.value }">
															<option value="${ it_size.id }"
																<c:if test="${ item.color_size.size.id==it_size.id }">
																	<c:out value="selected"></c:out>
																</c:if>>
																${ it_size.size_number }</option>
														</c:forEach>

													</select>
												</c:forEach>
											</c:if>
										</c:forEach>
									</div>
									<div class="price-cart">
										<c:if test="${ item.color_size.prod.discount > 0 }">
											<div class="flex">
												$
												<div class="price${ item.id }"
													id="${ item.color_size.prod.price - item.color_size.prod.price * item.color_size.prod.discount/100 }">
													<fmt:formatNumber type="number" maxFractionDigits="2"
														value="${ item.color_size.prod.price - item.color_size.prod.price * item.color_size.prod.discount/100 }" />
												</div>
											</div>
										</c:if>
										<c:if test="${ item.color_size.prod.discount <= 0 }">
											<div class="flex">
												$
												<div class="price${ item.id }"
													id="${ item.color_size.prod.price }">${ item.color_size.prod.price }</div>
											</div>
										</c:if>
									</div>
									<div class="amount-cart">
										<input class="minus-plus" type="button" name="${ item.id }"
											id="minus${ index.getIndex() }" onclick="amount(this)"
											value="-"> <input class="input_Id" type="text"
											name="${ item.id }" id="input_Id${ index.getIndex() }"
											value="${ item.quantity }" readonly> <input
											class="minus-plus" type="button" name="${ item.id }"
											id="plus${ index.getIndex() }" onclick="amount(this)"
											value="+">
									</div>
									<div class="total-money-cart">
										<c:if test="${ item.color_size.prod.discount > 0 }">
											<div class="flex">
												$
												<div class="total${ item.id }" id="${ item.id }">
													<fmt:formatNumber type="number" maxFractionDigits="2"
														value="${ item.color_size.prod.price * item.quantity - item.color_size.prod.price * item.quantity * item.color_size.prod.discount/100 }" />
												</div>
											</div>
										</c:if>
										<c:if test="${ item.color_size.prod.discount <= 0 }">
											<div class="flex">
												$
												<div class="total${ item.id }" id="${ item.id }">${ item.color_size.prod.price * item.quantity }</div>
											</div>
										</c:if>
									</div>
									<div class="del-product-cart">
										<input type="button" id="del_prod" name="${ item.id }"
											value="x" onclick="delete_prod(this)">
									</div>
								</td>
							</c:forEach>
						</tr>
					</table>
				</div>
				<div class="cheked-all">
					<div class="checkbox-all">
						<input type="checkbox" name="" id="checkbox-all">
					</div>
					<div class="text-all">ALL</div>
					<div class="total-payment">
						Total payment: &emsp; <span class="payment" id="payment"></span>
					</div>
					<div class="total-product-cart" id="total-count-product-cart">(0)</div>
				</div>
				<div class="btn-buy-continue">
					<div class="btn-effect">
						<button type="submit" name="continueShopping"
							id="continue-shopping">Continue Shopping</button>
					</div>
					<div class="btn-effect">
						<button type="button" name="checkoutCart" id="checkoutCart">Checkout</button>
					</div>
				</div>
			</c:if>
		</form>
	</header>

	<div class="box-msg" id="box-msg">
		<div class="msg-box-title">
			<h5>Message</h5>
		</div>
		<div class="msgbox-content">
			<p>You have not selected any products yet. Please choose at least
				one product to payment</p>
		</div>
		<div class="msgbox-btn-ok">
			<button id="ok" name="ok" onclick="OK(this)">OK</button>
		</div>
	</div>

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

	<!--  FOOTER -->
	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>
	<jsp:include page="../layouts/user/search.jsp"></jsp:include>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript">
		var userid = "${ sessionScope.userid }";
		var url = window.location.href;
		$("#checkoutCart").click(function() {
			var arr = document.querySelectorAll('.checkbox-cart input[type=checkbox]:checked');
			if(arr.length==0) {
				$("#message-done").removeClass("none");
				$("#content-msg-done").text("You must select at least one product for payment.");
			} else {
				var process = "";
				for(let i=0; i<arr.length; i++) {
					if(i==0) {
						process += arr[i].name;
					} else {
						process += "_" + arr[i].name;
					}
				}
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "/ShopTandT/cart/"+ userid +"?checkout="+process);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout-cart/"+process);
				};
				xhr.send();
			}
		});
	</script>

	<script type="text/javascript">
		$("#ok-done").click(function() {
			$("#message-done").addClass("none");
		});
		$("#cancel").click(function() {
			$("#message-notify").addClass("none");
		});
	</script>

	<script type="text/javascript">
	function delete_prod(x) {
		var url = window.location.href;
		if (confirm("Are you sure to remove the order from the cart?")) {
			var xhr = new XMLHttpRequest();
			xhr.open("GET", url+"?delete="+x.name);
			// What to do when server responds
			xhr.onload = function() {
				window.location.assign(url);
			};
			xhr.send();		
		}
	}
	</script>


	<script type="text/javascript">
		$(".foo").click(function() {
			var total = 0.0;
			var arrQty = document.querySelectorAll('.input_Id');
			var arr = document.querySelectorAll('.checkbox-cart input[type=checkbox]:checked');
			var arr1 = document.querySelectorAll('.checkbox-cart input[type=checkbox]');
			var all = document.querySelector('#checkbox-all');
			if (arr.length==arr1.length) {
				all.checked = true;
			} else {
				all.checked = false;
			}
			for (let i=0; i<arr.length; i++) {
				for(let j =0; j<arrQty.length; j++) {
					if(arrQty[j].name == arr[i].name) {
						total += parseFloat(arr[i].value)*parseFloat(arrQty[j].value);
					}
				}
			}
			$("#payment").text(Math.round(total*100)/100);
			$("#total-count-product-cart").text("("+arr.length+")");
		});
		
		$("#checkbox-all").click(function() { // price check box all
			var arrQty = document.querySelectorAll('.input_Id');
			if(this.checked == true) {
				var arr = document.querySelectorAll('.checkbox-cart input[type=checkbox]');
				for(let i=0; i<arr.length; i++) {
					arr[i].checked = true;
				}
				var total = 0.0;
				for (let i=0; i<arr.length; i++) {
					for(let j =0; j<arrQty.length; j++) {
						if(arrQty[j].name == arr[i].name) {
							total += parseFloat(arr[i].value)*parseFloat(arrQty[j].value);
						}
					}
				}
				$("#payment").text(Math.round(total*100)/100);
				$("#total-count-product-cart").text("("+arr.length+")");
			} else {
				var arr = document.querySelectorAll('.checkbox-cart input[type=checkbox]');
				for(let i=0; i<arr.length; i++) {
					arr[i].checked = false;
				}
				$("#payment").text("0");
				$("#total-count-product-cart").text("(0)");
			}
		});
	</script>

	<script type="text/javascript">
		var url = window.location.href;
		if(${user_id != null && user_id != ''}) {
			function amount(x) {
				var n = document.getElementsByClassName("input_Id");
				for (let i = 0; i <= n.length; i++) {
					if (x.id == ("plus" + i)) {
						//amount interface update when users click plus
						var input_txt = document.getElementById("input_Id" + i).value;
						let a = parseInt(input_txt) + 1;
						document.getElementById("input_Id" + i).value = a;
						var value_amount = document.getElementById("input_Id" + i);
						
						//price total interface when users click plus
						var arrP = document.querySelector('.price'+x.name);
						var price = arrP.id;
						var quantity = value_amount.value;
						var total = parseFloat(Math.round(price * quantity * 100)/100);
						$(".total"+x.name).text(total);
						
						//amount update in DB when users click plus
						var xhr = new XMLHttpRequest();
						xhr.open("GET", url+"?plus="+value_amount.name);
						xhr.onload = function() {};
						xhr.send(); 
					} else if (x.id == ("minus" + i)) {
						var input_txt = document.getElementById("input_Id" + i).value;
						if (parseInt(input_txt) > 1) {
							//amount interface update when users click minus
							let a = parseInt(input_txt) - 1;
							document.getElementById("input_Id" + i).value = a;
							var value_amount = document.getElementById("input_Id" + i);
							
							//price total interface when users click minus
							var arrP = document.querySelector('.price'+x.name);
							var price = arrP.id;
							var quantity = value_amount.value;
							var total = parseFloat(Math.round(price * quantity * 100)/100);
							$(".total"+x.name).text(total);
							
							//amount update in DB when users click minus
							var xhr = new XMLHttpRequest();
							xhr.open("GET", url+"?minus="+value_amount.name);
							xhr.onload = function() {
							};
							xhr.send(); 
						} else if (parseInt(input_txt) == 1) {
							var value_amount = document.getElementById("input_Id" + i);
							var u_id = "${ user_id}";
							if (confirm("Are you sure to remove the order from the cart?")) {
								var xhr = new XMLHttpRequest();
								xhr.open("GET", url+"?minus="+value_amount.name+"&minusdelete="+value_amount.name);
								// What to do when server responds
								xhr.onload = function() {
									window.location.assign(url);
								};
								xhr.send();
								return false;
							}
						}
					}
				}
				// load price total checked
				var total_ = 0.0;
				var arrQty = document.querySelectorAll('.input_Id');
				var arrC = document.querySelectorAll('.checkbox-cart input[type=checkbox]:checked');
				for (let i=0; i<arrC.length; i++) {
					for(let j =0; j<arrQty.length; j++) {
						if(arrQty[j].name == arrC[i].name) {
							total_ += parseFloat(arrC[i].value)*parseFloat(arrQty[j].value);
						}
					}
				}
				$("#payment").text(Math.round(total_*100)/100);
				$("#total-count-product-cart").text("("+arrC.length+")");
			}
			
			var user_id = "${ user_id}";
			$("#continue-shopping").click(function () {
				var xhr = new XMLHttpRequest();
				xhr.open("GET","");
				// What to do when server responds
				xhr.onload = function() {
					window.location.assign("/ShopTandT/products/new-arrivals");
				};
				xhr.send(); 
			});
		}
	</script>



	<c:forEach var="abc" items="${ cart }">
		<script> // remove display none in select option color when start
			var selected_s = "${abc.color_size.color.id}"+"_" +"${abc.color_size.prod.id}"+"_"+"${ abc.id }";
			//alert(selected_s);
			document.getElementById(selected_s).classList.remove('size');
		</script>
	</c:forEach>

	<script type="text/javascript">
			function OK(x) {
				document.getElementById("box-msg").classList.add('box-msg');
			}
		</script>

	<!-- if exists user id -->

	<c:if test="${ sessionScope.userid != null }">
		<script>
			var url = window.location.href;
			function size_select(x) {
				// x.id  = idsize_idcolor_idprod
				//x.value = idcart
				// size = idcart_idsize_idcolor_idprod
				var size = x.value + "_"+x.id; 
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						url+"?size="+size);
				xhr.onload = function() {
				};
				xhr.send();
			}
			function color_select(x) {
				var color = x.value; // color = colorid_ prodid_cartid
		 	   	let selectElement = document.querySelectorAll('[name=size]');
		 	   	for (let i=0; i<selectElement.length; i++) {
		 		   	if(selectElement[i].id == x.value) {
		 			  	document.getElementById(x.value).classList.remove('size'); 
		 		   	} else {
		 			 	const arr1 = selectElement[i].id.split("_");
		 			  	const arr2 = x.value.split("_");
		 			  	if (arr1[1] == arr2[1]) {
		 				 	document.getElementById(selectElement[i].id).classList.add('size');
		 			  	}
		 		   	}
		 	   	} 
		 	   	var xhr = new XMLHttpRequest();
				xhr.open("GET",
						url+"?color="+color);
				xhr.onload = function() {
				};
				xhr.send();
			}
		</script>
	</c:if>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="js/login.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>