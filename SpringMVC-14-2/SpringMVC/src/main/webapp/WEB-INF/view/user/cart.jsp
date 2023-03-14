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
<link rel="stylesheet" href="<c:url value="/assets/css/index.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/js/bootstrap.min.js"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/login.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/swiper-bundle.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/slide.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/cart.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/message.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/navscroll.css"/>">
<link rel="stylesheet"
	href='<c:url value="/assets/css/login-icon.css"/>'>
<style>
.flex {
    display: flex;
}
.size {
	display: none;
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
</style>
<body style="color: white;">
	<header class="container-xl header-content">
		
		<jsp:include page="../layouts/user/header.jsp"></jsp:include>
			<!--######################################################################################################### -->
		<form method="post" action="/SpringMVC/" id="myform">
			<div class="title-page">
				<h3>Cart</h3>
				<span><a href="/SpringMVC/">Home</a> / <a
					href="cart">Cart</a></span>
			</div>
			<c:set var="getProdCountCart" value="${ 0 }"></c:set>
			<c:forEach var="item" items="${ listCart }" varStatus="index">
				<c:set var="getProdCountCart" value="${ index.getCount() }"></c:set>
			</c:forEach>
			<c:if test="${ getProdCountCart==0 }">
				<div class="cart-empty">
					<h5>Cart is empty. Please add products so that the cart is not
						empty.</h5>
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

							<c:forEach var="item" items="${ listCart }" varStatus="index">
								<td>
									<div class="checkbox-cart">
										<c:if test="${ item.key.prod.discount <= 0 }">
											<input type="checkbox" class="foo" name="${ item.key.id }"
												id="${ item.value }"
												value="${ item.key.prod.price }">
										</c:if>
										<c:if test="${ item.key.prod.discount > 0 }">
											<input type="checkbox" class="foo" name="${ item.key.id }"
												id="${ item.value }"
												value="${ item.key.prod.price - item.key.prod.price * item.key.prod.discount/100 }">
										</c:if>
									</div>
									<div class="product-cart">
										<img
											src="<c:url value="/assets/images/products/${ item.key.prod.thumbnail }"/>"
											alt="product-img">
										<div class="name-product-cart">${ item.key.prod.title }</div>
									</div>
									<div class="classify-cart">
										<c:forEach var="it" items="${ hmProd_Color_Size }">
											<c:if test="${ item.key.prod.id == it.key }">
												<select id="${ it.key }" name="color${ it.key }"
													onchange="color_select(this)" class="color">
													<option value="" style="display: none;" disabled selected>Choose
														color</option>
													<c:forEach var="it_color" items="${ it.value }">
														<c:forEach var="colorName" items="${ listAllColor }">
															<c:if test="${ it_color.key == colorName.id }">
																<option style="background: ${ colorName.rgb };"
																	value="${ it_color.key }_${ item.key.prod.id }_${ item.key.id }"
																	<c:if test="${colorName.id==item.key.color.id }">
																			<c:out value="selected"></c:out>
																	</c:if>>
																	${colorName.color_name }</option>
															</c:if>
														</c:forEach>
													</c:forEach>
												</select>


												<c:forEach var="it_color" items="${ it.value }">
													<c:set var="sKey"
														value="${ it_color.key }_${ item.key.prod.id }"></c:set>
													<select
														id="${ it_color.key }_${ item.key.prod.id }_${ item.key.id }"
														class="size" name="size" onchange="size_select(this)">
														<option value="" style="display: none;" disabled selected>Choose
															size</option>
														<c:forEach var="it_size" items="${ it_color.value }">
															<option value="${ it_size.id }"
																<c:if test="${ item.key.size.id==it_size.id }">
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
										<c:if test="${ item.key.prod.discount > 0 }">
											<div class="flex">
												$<div class="price${ item.key.id }" id="${ item.key.prod.price - item.key.prod.price * item.key.prod.discount/100 }"><fmt:formatNumber type="number" maxFractionDigits="2"
														value="${ item.key.prod.price - item.key.prod.price * item.key.prod.discount/100 }" />
												</div>
											</div>
										</c:if>
										<c:if test="${ item.key.prod.discount <= 0 }">
											<div class="flex">
												$<div class="price${ item.key.id }" id="${ item.key.prod.price }">${ item.key.prod.price }</div>
											</div>
										</c:if>
									</div>
									<div class="amount-cart">
										<input class="minus-plus" type="button"
											name="${ item.key.id }"
											id="minus" onclick="amount(this)"
											value="-"> <input class="input_Id" type="text" id="input_Id${ item.key.id }" name="${ item.key.id }"
											value="${ item.value }" readonly> <input class="minus-plus"
											type="button" name="${ item.key.id }" id="plus"
											onclick="amount(this)" value="+">
									</div>
									<div class="total-money-cart">
										<c:if test="${ item.key.prod.discount > 0 }">
											<div class="flex">
												$<div class="total${ item.key.id }" id="${ item.key.id }">
													<fmt:formatNumber type="number" maxFractionDigits="2"
														value="${ item.key.prod.price * item.value - item.key.prod.price * item.value * item.key.prod.discount/100 }" />
												</div>
											</div>
										</c:if>
										<c:if test="${ item.key.prod.discount <= 0 }">
											<div class="flex">
												$<div class="total${ item.key.id }" id="${ item.key.id }">${ item.key.prod.price * item.value }</div>
											</div>
										</c:if>
									</div>
									<div class="del-product-cart">
										<input type="button" id="del_prod" name="${ item.key.id }"
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
					<div class="btn-continue">
						<input type="button" name="continueShopping" id="continue-shopping"
							value="Continue Shopping">
					</div>
					<div class="btn-buy-cart">
						<input type="button"
							name="checkoutCart" id="checkoutCart" value="Buy">
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
			Message
			<img alt="" src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>"></h2>
		<p class="content-msg content-msg-notify" id="content-msg-notify"></p>
		<div class="btn-ok-cancel">
			<input class="cancel" id="cancel" type="button" value="Cancel"> <input
				class="ok" id="ok-notify" type="button" value="OK">
		</div>
	</div>
	<div class="message msg-order message-done none" id="message-done">
		<h2 class="msg-h2">
			Message
			<img alt="" src="<c:url value="/assets/images/icons/icons8-notification-100-msg.png"/>"></h2>
		<p class="content-msg content-msg-done" id="content-msg-done"></p>
		<div class="btn-ok-cancel">
			<input
				class="ok" id="ok-done" type="button" value="OK">
		</div>
	</div>

	<!--  FOOTER -->
	<jsp:include page="../layouts/user/footer.jsp"></jsp:include>

	<jsp:include page="../layouts/user/search.jsp"></jsp:include>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$("#checkoutCart").click(function() {
			var arr = document.querySelectorAll('.checkbox-cart input[type=checkbox]:checked');
			if(arr.length==0) {
				$("#message-done").removeClass("none");
				$("#content-msg-done").text("Please select at least one product!");
			} else {
				var txt = "";
				for(let i=0; i<arr.length; i++) {
					if(i==0) {
						var qty = document.getElementById("input_Id"+arr[i].name).value;
						txt += arr[i].name +"_" + qty;
					} else {
						var qty = document.getElementById("input_Id"+arr[i].name).value;
						txt += "/" + arr[i].name +"_" + qty;
					}
				}
				if(txt != "") {
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "");
					xhr.onload = function() {
						window.location.assign("http://localhost:8888/SpringMVC/checkout-cart?process="+txt);
					};
					xhr.send();
				}
			}
		});
	</script>
		
	<script type="text/javascript">
		$("#continue-shopping").click(function () {
			var url = window.location.origin;
			$("#myform").attr("action", url + "/SpringMVC/products");
			$(this).attr('type', 'submit');
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
	
	<c:forEach var="abc" items="${ listCart }">
		<script> // remove display none in select option color when start
			var selected_s = "${abc.key.color.id}"+"_" +"${abc.key.prod.id}"+"_"+"${ abc.key.id }";
			//alert(selected_s);
			document.getElementById(selected_s).classList.remove('size');
		</script>
	</c:forEach>
	
	<script type="text/javascript">
			function OK(x) {
				document.getElementById("box-msg").classList.add('box-msg');
			}
		</script>
	<script type="text/javascript">
		var ca = document.getElementById("checkbox-all");
		var checkboxes = document.getElementsByName('foo');
		if (checkboxes.length == ${ listProd_id.size() }) {
			ca.checked = true;
		}
		var tcpc = document.getElementById("total-count-product-cart");
		tcpc.textContent = "("+${ listProd_id.size() }+")";
	</script>

	<!-- if exists user id -->

	<c:if test="${ userID == null }">
		<script>
		function size_select(x) {
			var size = x.value + "_"+x.id;
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"http://localhost:8888/SpringMVC/cart?size="+size);
			// What to do when server responds
			xhr.onload = function() {
				
			};
			xhr.send();
		}
		function color_select(x) {
			var color=x.value;
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"http://localhost:8888/SpringMVC/cart?color="+color);
			// What to do when server responds
			xhr.onload = function() {
			};
			xhr.send();
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
		}
	</script>


		<script>
		function amount(x) {
			if(x.id == 'plus') {
				var val = document.getElementById("input_Id"+x.name).value;
				document.getElementById("input_Id"+x.name).value = parseInt(val) + 1;
				var qty = document.getElementById("input_Id"+x.name).value;

				//price total interface when users click plus
				var value_amount = document.getElementById("input_Id" + x.name);
				var arrP = document.querySelector('.price'+x.name);
				var price = arrP.id;
				var quantity = value_amount.value;
				var total = parseFloat(Math.round(price * quantity * 100)/100);
				$(".total"+x.name).text(total);
				
				//amount update in DB when users click plus
				var url = window.location.href;
				var xhr = new XMLHttpRequest();
				xhr.open("GET", url+"?plus="+x.name);
				xhr.onload = function() {};
				xhr.send(); 
			}
			if(x.id == 'minus') {
				var val = document.getElementById("input_Id"+x.name).value;
				if(parseInt(val) == 1) {
					var value_amount = document.getElementById("input_Id" + x.name);
					$("#message-notify").removeClass("none");
					$("#content-msg-notify").text("Are you sure to remove the order from the cart?");
					$("#ok-notify").click(function() {
						$("#message-notify").addClass("none");
						$("#message-done").removeClass("none");
						$("#content-msg-done").text("Delete successfully!");
						var url = window.location.href;
						var xhr = new XMLHttpRequest();
						xhr.open("GET", url+"?minusdelete="+x.name);
						xhr.onload = function() {
							window.location.assign(url);
						};
						xhr.send();
					});
					return false;
				} else {
					document.getElementById("input_Id"+x.name).value = parseInt(val) - 1;
					var qty = document.getElementById("input_Id"+x.name).value;

					//price total interface when users click minus
					var value_amount = document.getElementById("input_Id" + x.name);
					var arrP = document.querySelector('.price'+x.name);
					var price = arrP.id;
					var quantity = value_amount.value;
					var total = parseFloat(Math.round(price * quantity * 100)/100);
					$(".total"+x.name).text(total);
					
					//amount update in DB when users click minus
					var url = window.location.href;
					var xhr = new XMLHttpRequest();
					xhr.open("GET", url+"?minus="+x.name);
					xhr.onload = function() {
					};
					xhr.send(); 
				}
			}
		}
	</script>
	</c:if>
	
	<script>
		function delete_prod(x) {
			$("#message-notify").removeClass("none");
			$("#content-msg-notify").text("Are you sure to remove the order from the cart?");
			$("#ok-notify").click(function() {
				$("#message-notify").addClass("none");
				$("#message-done").removeClass("none");
				$("#content-msg-done").text("Delete successfully!");
				var url = window.location.href;
				var xhr = new XMLHttpRequest();
				xhr.open("GET", url+"?delete="+x.name);
				xhr.onload = function() {
					window.location.assign(url);
				};
				xhr.send();	
			});	
			return false;
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

	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			effect : "coverflow",
			grabCursor : true,
			centeredSlides : true,
			slidesPerView : "auto",
			coverflowEffect : {
				rotate : 0,
				stretch : 0,
				depth : 150,
				modifier : 1,
				slideShadows : true,
			},
			loop : true,
		});
	</script>
	<!-- auto play header slide -->
	<script type="text/javascript">
		var counter = 1;
		setInterval(function() {
			document.getElementById('radio' + counter).checked = true;
			counter++;
			if (counter > 4) {
				counter = 1;
			}
		}, 5000);
	</script>

	<script>
		
		function bigImg(x) {
			var listkeys = document.getElementById("listkeys");
			listkeys.style.visibility = 'visible';
		}

		function normalImg(x) {
			var listkeys = document.getElementById("listkeys");
			listkeys.style.visibility = 'hidden';
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