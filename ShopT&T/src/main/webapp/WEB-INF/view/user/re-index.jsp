<!DOCTYPE html>
<html lang="en">
<title>Who are you? </title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href='<c:url value="/assets/css/bootstrap.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/js/bootstrap.js"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/f-index.css"/>'>
<link rel="stylesheet"
	href="<c:url value="/assets/css/newarrivals.css"/>">
<link rel="stylesheet"
	href='<c:url value="/assets/css/login-icon.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/bootstrap.min.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/js/bootstrap.min.js"/>'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href='<c:url value="/assets/css/login.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/swiper-bundle.min.css"/>'>
<link rel="stylesheet" href='<c:url value="/assets/css/slide.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/products_c.css"/>'>
<link rel="stylesheet"
	href='<c:url value="/assets/css/add-to-cart.css"/>'>
<link rel="stylesheet"
	href="<c:url value="/assets/css/f-zoom-img.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/home.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-header.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-menu.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/f-effect.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-footer.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/text.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/r-posts.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/re-text.css"/>">
<style>
.img-product-products {
	width: 100%;
	height: calC(21vw * 1.18) !important;
	background: #f1f1f1;
	border: 1px solid #cb82a9;
}

.show-function i:hover {
	cursor: pointer;
	text-shadow: 0px 0px 5px black;
	color: #cb82a9;
}

.buy-now {
	width: 92px;
	height: 36px;
	border: 0;
	border-radius: 4px;
	margin-left: 20px;
	color: white;
	background: #cb82a9 !important;
	margin-top: 3px;
}

div.position-product {
	margin-left: 6%;
	margin-top: 40px;
	display: flex;
}

div.section-3 {
	margin-top: 50px;
}

</style>
<link rel="stylesheet" href="<c:url value="/assets/css/f-favorite.css"/>">
<jsp:include page="../layouts/user/re-favorite.jsp"></jsp:include>
<body style="color: black;">
	<jsp:include page="../layouts/user/re-menu.jsp"></jsp:include>

	<div class="back-header">
		<jsp:include page="../layouts/user/re-header.jsp"></jsp:include>
	</div>
	<header class="container-xl header-content">
		<!-- important -->
		<div class="header-slide">
			<div class="slider">
				<div class="slides">
					<!--radio buttons start-->
					<input type="radio" name="radio-btn" id="radio1"> <input
						type="radio" name="radio-btn" id="radio2"> <input
						type="radio" name="radio-btn" id="radio3"> <input
						type="radio" name="radio-btn" id="radio4">
					<!--radio buttons end-->
					<!--slide images start-->

					<c:forEach var="item" items="${ slides }" varStatus="index">
						<c:if test="${ index.getIndex() == 0 }">
							<div class="slide first">
								<img src="<c:url value="/assets/images/slides/${ item.img }"/>"
									alt="">
							</div>
						</c:if>
						<c:if test="${ index.getIndex() != 0 }">
							<div class="slide">
								<img src="<c:url value="/assets/images/slides/${ item.img }"/>"
									alt="">
							</div>
						</c:if>
					</c:forEach>
					<!--slide images end-->
					<!--automatic navigation start-->
					<div class="navigation-auto">
						<div class="auto-btn1"></div>
						<div class="auto-btn2"></div>
						<div class="auto-btn3"></div>
						<div class="auto-btn4"></div>
					</div>
					<!--automatic navigation end-->
				</div>
				<!--manual navigation start-->
				<div class="navigation-manual">
					<label for="radio1" class="manual-btn"></label> <label for="radio2"
						class="manual-btn"></label> <label for="radio3" class="manual-btn"></label>
					<label for="radio4" class="manual-btn"></label>
				</div>
				<!--manual navigation end-->
			</div>
			<!--image slider end-->
		</div>

		<!-- ###########################     SECTION 0 - NEW ARRIVALS  ################################################### -->
		<div class="section">
			<div class="text">
				<h3>NEW</h3>
				<p class="cool">
					<span data-text="ARRIVALS" style="color: white;">ARRIVALS</span>
				</p>
			</div>
			<div class="position-product">

				<c:forEach var="it" items="${ listNewArrivals }" varStatus="index">
					<div class="products-el">
						<c:if test="${ sessionScope.userid == null }">
							<c:if test="${ it.discount > 0 }">
								<a href="/ShopTandT/product-details?product-id=${ it.id }">
									<div class="img-product-products zoom zoo" id="ex1"
										name="${it.discount }%" style="">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="img-product">
									</div>
								</a>
							</c:if>
							<c:if test="${ it.discount <= 0 }">
								<a href="/ShopTandT/product-details?product-id=${ it.id }">
									<div class="img-product-products zoom" id="ex1"
										name="${it.discount }%" style="">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="img-product">
									</div>
								</a>
							</c:if>
						</c:if>
						<c:if test="${ sessionScope.userid != null }">
							<c:if test="${ it.discount > 0 }">
								<a
									href="/ShopTandT/product-details/${ sessionScope.userid }_${ it.id }">
									<div class="img-product-products zoom zoo" id="ex1"
										name="${it.discount }%" style="">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="img-product">
									</div>
								</a>
							</c:if>
							<c:if test="${ it.discount <= 0 }">
								<a
									href="/ShopTandT/product-details/${ sessionScope.userid }_${ it.id }">
									<div class="img-product-products zoom" id="ex1"
										name="${it.discount }%" style="">
										<img
											src="<c:url value="/assets/images/products/${ it.thumbnail }"/>"
											alt="img-product">
									</div>
								</a>
							</c:if>
						</c:if>
						<div class="content-product-products">
							<div class="brand-product-products">${ it.sub_category.sub_category_name }</div>
							<div class="name-product-products">
								<c:if test="${ sessionScope.userid != null }">
									<a
										href="/ShopTandT/product-details/${ sessionScope.userid }_${ it.id }">${ it.title }</a>
								</c:if>
								<c:if test="${ sessionScope.userid == null }">
									<a href="/ShopTandT/product-details?product-id=${ it.id }">${ it.title }</a>
								</c:if>
							</div>
							<div class="show-products">
								<div class="price-product-products">
									<c:if test="${ it.discount > 0}">
										<div class="price-sale-products">
											$
											<fmt:formatNumber
												value="${it.price - it.price*it.discount/100 }"
												type="number" maxFractionDigits="2" />
										</div>
										<div class="price-old-products">
											<b>$${ it.price }</b>
										</div>
									</c:if>
									<c:if test="${ it.discount <= 0}">
										<div class="price-sale-products">$${ it.price }</div>
									</c:if>

								</div>
								<div class="rate-product-products">
									5.0
									<div class="img-rate-product-products">
										<img src="<c:url value="/assets/images/icons.star24.png"/>"
											alt="">
									</div>
									| Sold (${ it.sold })
								</div>
								<div class="favorite-product-products">
									<c:set var="vfirstColor" value="${ firstColor }"></c:set>
									<div class="show-function" style="margin-left: 5px;">
										<button class="favorite-product" id="${ it.id }">
											<i class="fa fa-heart" aria-hidden="true"></i>
										</button>
										<button type="button" class="add-to-cart" name="add-to-cart"
											id="add-to-cart" value="${ it.id }">
											<i class="fa fa-cart-plus" aria-hidden="true"></i>
										</button>
										<button class="buy-now" class="shadow-1" id="${ it.id }">Buy
											now</button>
									</div>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>

			</div>
		</div>
		<div class="img_poster-new-arrivals container-xl">
			<img
				src="<c:url value="/assets/images/poster/z4124954819721_a21620ad6413618390477292c680b45f_04bbb72a16b444e59f889805257a77d6.webp"/>"
				class="img_poster-new-arrivals img-fluid"
				alt="img_poster-new-arrivals">
		</div>

		<!-- ###########################     SECTION 3 - MOST LOVED PRODUCTS     ################################################### -->
		<div class="section-3">
			<div class="text">
				<h3>MOST LOVED</h3>
				<p class="cool">
					<span data-text="PRODUCTS" style="color: white;">PRODUCTS</span>
				</p>
			</div>
			<div class="position-product-effect">
				<div class="backward">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-love-arrow-100.png"/>">
				</div>
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<c:forEach var="item" items="${ listMostLovedProducts}"
							varStatus="index">
							<div class="swiper-slide">
								<div class="effect">
									<c:if test="${ sessionScope.userid != null }">
										<c:if test="${ item.discount > 0 }">
											<a
												href="/ShopTandT/product-details/${ sessionScope.userid }_${ item.id }">
												<div class="zoom-most-loved zoo"
													id="ee${ index.getIndex() }" name="${item.discount }%">
													<img class="product-effect"
														src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
												</div>
											</a>
										</c:if>
										<c:if test="${ item.discount <= 0 }">
											<a
												href="/ShopTandT/product-details/${ sessionScope.userid }_${ item.id }">
												<div class="zoom-most-loved" id="ee${ index.getIndex() }"
													name="${item.discount }%">
													<img class="product-effect"
														src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
												</div>
											</a>
										</c:if>
									</c:if>
									<c:if test="${ sessionScope.userid == null }">
										<c:if test="${ item.discount > 0 }">
											<a href="/ShopTandT/product-details?product-id=${ item.id }">
												<div class="zoom-most-loved zoo"
													id="ee${ index.getIndex() }" name="${item.discount }%">
													<img class="product-effect"
														src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
												</div>
											</a>
										</c:if>
										<c:if test="${ item.discount <= 0 }">
											<a href="/ShopTandT/product-details?product-id=${ item.id }">
												<div class="zoom-most-loved" id="ee${ index.getIndex() }"
													name="${item.discount }%">
													<img class="product-effect"
														src="<c:url value="/assets/images/products/${ item.thumbnail }"/>" />
												</div>
											</a>
										</c:if>
									</c:if>
									<div class="content-effect">
										<div class="details">
											<c:if test="${ sessionScope.userid == null }">
												<a class="product-link-effect"
													href="/ShopTandT/product-details?product-id=${ item.id }"><p
														class="name-product-effect">${ item.title }</p></a>
											</c:if>
											<c:if test="${ sessionScope.userid != null }">
												<a class="product-link-effect"
													href="/ShopTandT/product-details/${ sessionScope.userid }_${ item.id }"><p
														class="name-product-effect">${ item.title }</p></a>
											</c:if>
											<div class="fun-hover-effect">
												<div class="price-effect">
													<c:if test="${ item.discount > 0}">
														<p class="price-sale-effect">
															<b>$<fmt:formatNumber
																	value="${item.price + item.price*item.discount/100 }"
																	type="number" maxFractionDigits="2" /></b>
														</p>
														<p class="price-old-effect"
															style="text-decoration-line: line-through;">
															<b>$${ item.price}</b>
														</p>
													</c:if>
													<c:if test="${ item.discount <= 0}">
														<p class="price-sale-effect">
															<b>$${ item.price}</b>
														</p>
													</c:if>


												</div>
												<div class="rate-product-effect">
													<div class="rate-effect">
														4.8 <img class="star-rate-effect"
															src="<c:url value="/assets/images/icons/star24.png"/>"
															alt="img-product"> | Sold ${ item.sold }
													</div>
												</div>
												<div class="favorite-product-products-effect">
													<div class="show-function-effect">
														<button class="favorite-effect">
															<i class="fa fa-heart" aria-hidden="true"></i>
														</button>
														<button class="add-to-cart-effect" id="add-to-cart-effect"
															value="${ item.id }">
															<i class="fa fa-cart-plus" aria-hidden="true"></i>
														</button>
														<button class="buy-effect" id="${ item.id }">Buy
															now</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="forward">
					<img alt=""
						src="<c:url value="/assets/images/icons/icons8-love-arrow-100.png"/>">
				</div>
			</div>

		</div>
		<!-- ###########################     SECTION 1 - SELL SAME PRICE    ################################################### -->
		<div class="section-1 section-newarrivals">
			<div class="newarrivals">
				<div class="wrappser-arr">
					<div class="content-arr1">
						<div class="abs-arr">
							<div class="text">
								<h3>NEW</h3>
								<p class="cool">
									<span data-text="ARRIVALS" style="color: white;">ARRIVALS</span>
								</p>
							</div>
							<hr>
							<p>At She She, women can find the newest items from edgy
								undiscovered designers alongside basic everyday styles from
								well-known names.</p>
							<p>Ever-changing and always current, our clients appreciate
								the diverse selection and varied price ranges for the fashion
								addict in all of us.</p>
							<div class="btn-arr">
								<div class="btn-effect">
									<button type="button" name="" id="">Shopping</button>
								</div>
							</div>
						</div>
					</div>
					<div class="content-arr2">
						<img
							src="<c:url value="/assets/images/poster/entro_media_012723_d20222_0002_x1000.webp"/>"
							alt="img_arrivals">
					</div>
					<div class="content-arr3">
						<div class="img-arr-top">
							<img
								src="<c:url value="/assets/images/poster/2023-02-23_13_x600.webp"/>"
								alt="img_arrivals">
						</div>
						<div class="img-arr-bottom">
							<img
								src="<c:url value="/assets/images/poster/2023-02-24_29_x600.webp"/>"
								alt="img_arrivals">
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<jsp:include page="../layouts/user/re-footer.jsp"></jsp:include>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

<script type="text/javascript">
	$(".favorite-product").click(function(){
		var get = this;
		var classc = $(get).children().attr('class');
		var prod_id = get.id;
		var num = $("#favorite-number").val();
		if(num == "") {
			num = 1;
		}
		if(classc.includes("favorite-color")) {
			$(get).children().removeClass("favorite-color");
			var nnum = parseInt(num) - 1;
			$("#favorite-number").val(nnum);
		} else {
			$(get).children().addClass("favorite-color");
			var nnum = parseInt(num) + 1;
			$("#favorite-number").val(nnum);
		}
		
		// send data to server
		var xhr = new XMLHttpRequest();
		xhr.open("GET",
				"/ShopTandT/favorite/"+prod_id);
		xhr.onload = function() {
			location.reload();
		};
		xhr.send();
	});
</script>

	<script> // add to cart
		var id_user = "";
		if(${ sessionScope.userid != null }) {
			id_user = "${ sessionScope.userid }";
		}
		if(id_user != "") {
			$(".add-to-cart").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/add-to-cart/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/"+id_user);
				};
				xhr.send();
			});
			$(".add-to-cart-effect").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/add-to-cart/"+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/"+id_user);
				};
				xhr.send();
			});
		} else {
			$(".add-to-cart").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/cart?id="+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart");
				};
				xhr.send();
			});
			$(".add-to-cart-effect").click(function() {
				var id_prod = $(this).val();
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/cart?id="+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart");
				};
				xhr.send();
			});
		}
	</script>
	<script> // buy now
		var id_user = "";
		if(${ sessionScope.userid != null }) {
			id_user = "${ sessionScope.userid }";
		}
		if(id_user != "") {
			$(".buy-now").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/?buynow&blockid="+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout/"+id_user+"_"+id_prod);
				};
				xhr.send();
			});
			
			$(".buy-effect").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/?buynow&blockid="+id_user+"_"+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout/"+id_user+"_"+id_prod);
				};
				xhr.send();
			});
		} else {
			$(".buy-now").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET","/ShopTandT/?buynow&blockid="+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout/"+id_prod);
				};
				xhr.send();
			});
			
			$(".buy-effect").click(function(e) {
				var id_prod = e.target.id;
				var xhr = new XMLHttpRequest();
				xhr.open("GET",
						"/ShopTandT/?buynow&blockid="+id_prod);
				xhr.onload = function() {
					window.location.assign("/ShopTandT/cart/checkout/"+id_prod);
				};
				xhr.send();
			});
		}
	</script>


	<script>
	$(".ok-btn").click(function () {
		$(".welcome").addClass("none");
		$(".wrapper-wel").addClass("importantNone");
	});
	</script>

	<script>
	function logout() {
		$(document).ready(function(){
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"/ShopTandT/home?logout=true");
			xhr.onload = function() {
				window.location.assign("/ShopTandT/");
			};
			xhr.send();
		});
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
				depth : 0,
				modifier : 0,
				slideShadows : true,
			},
			 navigation: {
			        nextEl: ".forward",
			        prevEl: ".backward",
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

	<script src="<c:url value="/assets/js/jquery.zoom.js"/>"></script>
	<script>
		var div1 = document.getElementsByClassName('zoom');
		$(document).ready(function() {
			for (let i = 0; i < div1.length; i++) {
				$(div1[i]).zoom();
			}
		});
		var div2 = document.getElementsByClassName('zoom-most-loved');
		$(document).ready(function() {
			for (let i = 0; i < div2.length; i++) {
				$(div2[i]).zoom();
			}
		});
		var div3 = document.getElementsByClassName('zoom-same-price-product');
		$(document).ready(function() {
			for (let i = 0; i < div3.length; i++) {
				$(div3[i]).zoom();
			}
		});
	</script>
	<script type="text/javascript">
		if ( window.history.replaceState ) {
		  window.history.replaceState( null, null, window.location.href );
		}
	</script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"/>"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"/>"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

	<script src="<c:url value="js/login.js"/>"></script>
	<script
		src="<c:url value="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"/>"></script>
	<script
		src="<c:url value="https://kit.fontawesome.com/a076d05399.js"/>"></script>

</body>

</html>