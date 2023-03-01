<!DOCTYPE html>
<html lang="en">
<title>Cart :)</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
.size {
	display: none;
}
</style>
<body style="color: white;">
	<header class="container-xl header-content">
		<form method="post">
			<jsp:include page="../layouts/user/header.jsp"></jsp:include>
			<!--######################################################################################################### -->
			<div class="title-page">
				<h3>Cart</h3>
				<span><a href="/welcome-to-uchiha-shoes/">Home</a> / <a
					href="cart">Cart</a></span>
			</div>
			<c:set var="getProdCountCart" value="${ 0 }"></c:set>
			<c:forEach var="item" items="${ listProd }" varStatus="index">
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

							<c:forEach var="item" items="${ listProd }" varStatus="index">
								<td>
									<div class="checkbox-cart">
										<c:if test="${ checkedAll == 'true' }">
											<input type="checkbox" name="foo"
												id="${ item.key.id }_${ item.value }"
												onclick="checked_prod(this)" checked>
										</c:if>
										<c:if test="${ checkedAll != 'true' }">

											<c:if test="${ listProd_id.contains(item.key.id) }">
												<input type="checkbox" name="foo"
													id="${ item.key.id }_${ item.value }"
													onclick="checked_prod(this)" checked>
											</c:if>
											<c:if test="${ !listProd_id.contains(item.key.id) }">
												<input type="checkbox" name="foo"
													id="${ item.key.id }_${ item.value }"
													onclick="checked_prod(this)">
											</c:if>

										</c:if>
									</div>
									<div class="product-cart">
										<img
											src="<c:url value="/assets/images/products/${ item.key.thumbnail }"/>"
											alt="product-img">
										<div class="name-product-cart">${ item.key.title }</div>
									</div>
									<div class="classify-cart">
										<c:forEach var="it" items="${ hmProd_Color_Size }">
											<c:if test="${ item.key.id == it.key }">
												<select id="${ it.key }" name="color${ it.key }"
													onchange="color_select(this)" class="color">
													<option value="" style="display: none;" disabled selected>Choose
														color</option>
													<c:forEach var="it_color" items="${ it.value }">
														<c:forEach var="colorName" items="${ listAllColor }">
															<c:if test="${ it_color.key == colorName.id }">
																<option style="background: ${ colorName.rgb };"
																	value="${ it_color.key }_${ item.key.id }"
																	<c:forEach var="li_color_1" items="${ listColor }">
															<c:if test="${ li_color_1.value == it_color.key && li_color_1.key==item.key.id }">
															<c:out value="selected"></c:out>
															</c:if>
															</c:forEach>>
																	${colorName.color_name }</option>

															</c:if>
														</c:forEach>
													</c:forEach>
												</select>

												<c:forEach var="it_color" items="${ it.value }">
													<c:set var="sKey"
														value="${ it_color.key }_${ item.key.id }"></c:set>
													<select id="${ it_color.key }_${ item.key.id }"
														class="size" name="size" onchange="size_select(this)">
														<option value="" style="display: none;" disabled selected>Choose
															size</option>
														<c:forEach var="it_size" items="${ it_color.value }">
															<option value="${ it_size.id }"
																<c:forEach var="i_size_" items="${ listSize }">
														<c:if test="${ i_size_.key == sKey && i_size_.value==it_size.id }">
														<c:out value="selected"></c:out>
														</c:if>
													</c:forEach>>
																${ it_size.size_number }</option>
														</c:forEach>

													</select>
												</c:forEach>
											</c:if>
										</c:forEach>
									</div>
									<div class="price-cart">
										<c:if test="${ item.key.discount > 0 }">
											<div>
												$
												<fmt:formatNumber type="number" maxFractionDigits="2"
													value="${ item.key.price - item.key.price * item.key.discount/100 }" />
											</div>
										</c:if>
										<c:if test="${ item.key.discount <= 0 }">
											<div>$${ item.key.price }</div>
										</c:if>
									</div>
									<div class="amount-cart">
										<input class="minus-plus" type="button"
											name="${ item.key.id }_${ item.value }"
											id="minus${ index.getIndex() }" onclick="amount(this)"
											value="-"> <input class="input_Id" type="text"
											name="prod" id="input_Id${ index.getIndex() }"
											value="${ item.value }" readonly> <input
											class="minus-plus" type="button"
											name="${ item.key.id }_${ item.value }"
											id="plus${ index.getIndex() }" onclick="amount(this)"
											value="+">
									</div>
									<div class="total-money-cart">
										<c:if test="${ item.key.discount > 0 }">
											<div>
												$
												<fmt:formatNumber type="number" maxFractionDigits="2"
													value="${ item.key.price * item.value - item.key.price * item.value * item.key.discount/100 }" />
											</div>
										</c:if>
										<c:if test="${ item.key.discount <= 0 }">
											<div>$${ item.key.price * item.value }</div>
										</c:if>
									</div>
									<div class="del-product-cart">
										<input type="button" id="del_prod"
											name="${ item.key.id }_${ item.value }" value="x"
											onclick="amount(this)">
									</div>

								</td>

							</c:forEach>
						</tr>
					</table>
				</div>
				<div class="cheked-all">
					<div class="checkbox-all">
						<c:if test="${ checkedAll == 'true' }">
							<input type="checkbox" onclick="toggle(this)" name=""
								id="checkbox-all" checked>
						</c:if>
						<c:if test="${ checkedAll != 'true' }">
							<input type="checkbox" onclick="toggle(this)" name=""
								id="checkbox-all">
						</c:if>
					</div>
					<div class="text-all">ALL</div>
					<div class="total-payment">
						Total payment: &emsp; <span>$<fmt:formatNumber
								type="number" maxFractionDigits="2" value="${ totalPayment }" /></span>
					</div>
					<div class="total-product-cart" id="total-count-product-cart">(0)</div>
				</div>
				<div class="btn-buy-continue">
					<div class="btn-continue">
						<input type="submit" name="continueShopping" id=""
							value="Continue Shopping">
					</div>
					<div class="btn-buy-cart">
						<input type="button" onclick="checkoutAll(this)"
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
	
	<!--  FOOTER -->
	<jsp:include page="../layouts/user/footer.jsp"></jsp:include>

	<c:forEach var="abc" items="${ listColor }">
		<script>
			var selected_s = "${abc.value}"+"_" +"${abc.key}";
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

<!-- if exists -->

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
	function checkoutAll (x) {
		var checkboxes = document.getElementsByName('foo');
		var check = document.querySelectorAll('input[type="checkbox"]:checked').length;		
		var check1 = document.querySelectorAll('input[name^="foo"]:checked');
		var str = "";
			for (let i=0; i< check1.length; i++) 
			{
				if (str != "" ) {
					str += "_"+check1[i].id;
				} else {
					str = check1[i].id;
				}
			}
			var xhr = new XMLHttpRequest();
			if(check1.length==0) {
				
				document.getElementById("box-msg").classList.remove('box-msg');
				document.getElementById("box-msg").classList.add('box-msg-show');
			} else {
				var txt_c = "";
				var error = "";
				var x = document.querySelectorAll('input[name^="foo"]:checked');
				for (let i=0; i<x.length; i++) {
					const arr = x[i].id.split("_");
					var id_prod = arr[0];
					var quantity = arr[1];
					
					var id_color_select = document.getElementById(arr[0]).value;
					const id_color = id_color_select.split("_");
					var checkColor = document.getElementById(id_color_select);
					if(checkColor == null) {
						error = "You have not selected color!";
					} else {
						var id_size = document.getElementById(id_color_select).value;
						if (id_size=="") {
							error = "You have not selected size!";
						} else {
							if (txt_c=="") {
								txt_c = id_prod+"_"+id_color[0]+"_"+id_size+"_"+quantity;
							} else {
								txt_c += "/" + id_prod+"_"+id_color[0]+"_"+id_size+"_"+quantity;
							}
							
						}
						
					}
				}
				if(error != "") {
					alert(error);
				} else {
					xhr.open("GET",
							"http://localhost:8888/SpringMVC/cart/checkout-cart?process="+txt_c);
					xhr.onload = function() {
						window.location.assign("http://localhost:8888/SpringMVC/cart/checkout-cart?process="+txt_c);
					};
					xhr.send();
				}
			}		
	}
	</script>

	

		<script>
		
		if (${checkedAll=='true'}) {
			checkboxes = document.getElementsByName('foo');
			var tcpc = document.getElementById("total-count-product-cart");
			tcpc.textContent = "("+checkboxes.length+")";
		} 
		function toggle(source) {
			checkboxes = document.getElementsByName('foo');
			for (var i = 0, n = checkboxes.length; i < n; i++) {
				checkboxes[i].checked = source.checked;
			}
			if(source.checked==true) {
				checkboxes = document.getElementsByName('foo');
				var tcpc = document.getElementById("total-count-product-cart");
				tcpc.textContent = "("+checkboxes.length+")";
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/cart?checkedAll=true");
				// What to do when server responds
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart?checkedAll=true");
				};
				xhr.send();	
			} else if(source.checked==false) {
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"http://localhost:8888/SpringMVC/cart?checkedAll=false");
				// What to do when server responds
				xhr.onload = function() {
					window.location.assign("http://localhost:8888/SpringMVC/cart");
				};
				xhr.send();
				
				var tcpc = document.getElementById("total-count-product-cart");
				tcpc.textContent = "(0)";
			}
			
		}
		
	</script>

		<script type="text/javascript">

		function checked_prod(x) {
			var x = document.querySelectorAll('input[name^="foo"]:checked');
			
			var ca = document.getElementById("checkbox-all");
			var tcpc = document.getElementById("total-count-product-cart");
			
			checkboxes = document.getElementsByName('foo').length;
			check = document.querySelectorAll('input[type="checkbox"]:checked').length;
			var checked = document.querySelectorAll('input[type="checkbox"]:checked');
			
			var txt_m = "";
			for (let i =0; i<checked.length; i++) {
				if (txt_m=="" && checked[i].id != "checkbox-all") {
					txt_m = checked[i].id;
				} else if (checked[i].id != "checkbox-all"){
					txt_m += "/" + checked[i].id;
				}
			}
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"http://localhost:8888/SpringMVC/cart?totalmoney="
							+ txt_m);
			// What to do when server responds
			xhr.onload = function() {
				if (x.length == 0) {
					window.location.assign("http://localhost:8888/SpringMVC/cart");
				} else {
					window.location.assign("http://localhost:8888/SpringMVC/cart?totalmoney="
							+ txt_m);
				}
				
			};
			xhr.send();
			
			if (ca.checked==true) {
				tcpc.textContent = "("+(document.querySelectorAll('input[type="checkbox"]:checked').length)+")";
			} else {
				tcpc.textContent = "("+document.querySelectorAll('input[type="checkbox"]:checked').length+")";
			}
			if (x.checked==false) {
				ca.checked = false;
				tcpc.textContent = "("+document.querySelectorAll('input[type="checkbox"]:checked').length+")";
			} else {
				if (check==checkboxes) {
					ca.checked = true;
					tcpc.textContent = "("+(document.querySelectorAll('input[type="checkbox"]:checked').length-1)+")";
				}
			}
		}
	</script>


		<script>
		function amount(x) {

			var n = document.getElementsByName("prod");
			for (let i = 0; i <= n.length; i++) {

				if (x.id == ("plus" + i)) {
					var input_txt = document.getElementById("input_Id" + i).value;
					let a = parseInt(input_txt) + 1;
					document.getElementById("input_Id" + i).value = a;
					var value_amount = document.getElementById("input_Id" + i).value;
					var xhr = new XMLHttpRequest();
					xhr.open("GET",
							"http://localhost:8888/SpringMVC/cart?plus="
									+ x.name);
					// What to do when server responds
					xhr.onload = function() {
						window.location.assign("http://localhost:8888/SpringMVC/cart");
					};
					xhr.send();
					return false;
				} else if (x.id == ("minus" + i)) {
					var input_txt = document.getElementById("input_Id" + i).value;
					if (parseInt(input_txt) > 1) {
						let a = parseInt(input_txt) - 1;
						document.getElementById("input_Id" + i).value = a;
						var value_amount = document.getElementById("input_Id" + i).value;
						var xhr = new XMLHttpRequest();
						xhr.open("GET",
								"http://localhost:8888/SpringMVC/cart?minus="
										+ x.name);
						// What to do when server responds
						xhr.onload = function() {
							window.location.assign("http://localhost:8888/SpringMVC/cart");
						};
						xhr.send();
						return false;
					} else if (parseInt(input_txt) == 1) {
						if (confirm("Are you sure to remove the order from the cart?")) {
							var xhr = new XMLHttpRequest();
							xhr.open("GET",
									"http://localhost:8888/SpringMVC/cart?remove="
											+ x.name);
							// What to do when server responds
							xhr.onload = function() {
								window.location.assign("http://localhost:8888/SpringMVC/cart");
							};
							xhr.send();
							return false;
						}
					}
				}
				if (x.id == "del_prod") {
					if (confirm("Are you sure to remove the order from the cart?")) {
						var xhr = new XMLHttpRequest();
						xhr.open("GET",
								"http://localhost:8888/SpringMVC/cart?deleleProduct="
										+ x.name);
						// What to do when server responds
						xhr.onload = function() {
							window.location.assign("http://localhost:8888/SpringMVC/cart");
						};
						xhr.send();
						
						break;
					}
				}
			}

		}
	</script>
	</c:if>

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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="js/login.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>